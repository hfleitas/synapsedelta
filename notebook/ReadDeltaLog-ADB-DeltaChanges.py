# Databricks notebook source
# Create input widgets, which will accept parameters passed in via the ADF Databricks Notebook activity
dbutils.widgets.text("accountName", "", "Account Name")
dbutils.widgets.text("accountKey", "", "Account Key")
dbutils.widgets.text("containerName", "", "Container Name")
dbutils.widgets.text("deltaPath", "", "Delta Path")
dbutils.widgets.text("jdbcConnectionString", "", "jdbcConnectionString")
#dbutils.widgets.help()

# MAGIC %md
# MAGIC ### Notebook source
# MAGIC [DeltaChanges.py](https://github.com/hfleitas/hiramdatabricks/blob/main/Includes/DeltaChanges.py)

# COMMAND ----------

# Assign variables to the passed in values of the widgets
accountName = dbutils.widgets.get("accountName")
accountKey = dbutils.widgets.get("accountKey")
containerName = dbutils.widgets.get("containerName")
deltaPath = dbutils.widgets.get("deltaPath")
jdbcConnectionString = dbutils.widgets.get("jdbcConnectionString")

# Create connection string to use for accessing files in the storage account
connectionString = "abfss://%(containerName)s@%(accountName)s.dfs.core.windows.net/" % locals()
# connectionString

# COMMAND ----------

# Create connection to the Azure Storage account
spark.conf.set("fs.azure.account.key." + accountName + ".dfs.core.windows.net", accountKey)

# COMMAND ----------

deltalog = "%(connectionString)s%(deltaPath)s" % locals()
print(deltalog)
df_delta = spark.read.format("delta").load(deltalog) 
df_delta.show() 

# COMMAND ----------

df_delta.createOrReplaceTempView("df_delta")

# COMMAND ----------

# MAGIC %md
# MAGIC ### couldnt do it in python. 😢 🐍

# COMMAND ----------

latest = df_delta.selectExpr("key", "struct(time, newValue, deleted) as otherCols") \
  .groupBy("key") \
  .agg({"otherCols": "max"}) \
  .alias("latest") \
  .selectExpr("key", "latest.*")
latest.show()

# fail! cant max a string. all exprs should be Column. agg(max("otherCols as latest"))

# COMMAND ----------

# MAGIC %md
# MAGIC ### scala works! 😃🥊🛢️🎯

# COMMAND ----------

# MAGIC %scala
# MAGIC import org.apache.spark.sql.functions._ //super important!!!
# MAGIC 
# MAGIC val df_delta = spark.sqlContext.sql("select * from df_delta")
# MAGIC df_delta.show()
# MAGIC 
# MAGIC val latestonly = df_delta
# MAGIC   .selectExpr("key", "struct(time, newValue, deleted) as otherCols" )
# MAGIC   .groupBy("key")
# MAGIC   .agg(max("otherCols").as("latest"))
# MAGIC   .selectExpr("key", "latest.*")
# MAGIC 
# MAGIC latestonly.show() 
# MAGIC 
# MAGIC latestonly.createOrReplaceTempView("latestonly")

# COMMAND ----------

# MAGIC %scala 
# MAGIC Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver")
# MAGIC import java.sql.{Connection, DriverManager, ResultSet, Statement}; 
# MAGIC 
# MAGIC def dt = {
# MAGIC     val connection_string = dbutils.widgets.get("jdbcConnectionString")
# MAGIC     val connection = DriverManager.getConnection(connection_string)
# MAGIC     try {
# MAGIC         val statement = connection.createStatement()
# MAGIC         val results = statement.executeQuery(" if object_id('latestonly') is not null drop table latestonly; select 1")
# MAGIC     } finally {
# MAGIC         connection.close
# MAGIC     } 
# MAGIC }
# MAGIC 
# MAGIC dt

# COMMAND ----------

jdbcConnectionString = dbutils.widgets.get("jdbcConnectionString")
latestonly = sqlContext.sql("select * from latestonly")

latestonly.write \
  .format("com.databricks.spark.sqldw") \
  .option("useAzureMSI", "true") \
  .option("url", jdbcConnectionString) \
  .mode("overwrite") \
  .option("dbtable", "latestonly") \
  .option("tempDir", "abfss://dwtemp@wplushiramsynapseadlsv2.dfs.core.windows.net/adbtemp") \
  .save()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Return OK status

# COMMAND ----------

import json
dbutils.notebook.exit(json.dumps({
  "status": "OK",
  "message": "Cleaned data and created persistent table",
  "tables": ["latestonly"]
}))
