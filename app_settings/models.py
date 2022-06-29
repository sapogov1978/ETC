from django.db import models

class Blocks(models.Model):
    blockNumber = models.CharField(max_length=10)
    timeStamp = models.CharField(max_length=10)
    hash = models.CharField(max_length=70)
    nonce = models.CharField(max_length=8)
    blockHash = models.CharField(max_length=70)
    transactionIndex = models.CharField(max_length=2)
    _from = models.CharField(max_length=45, db_column="From")
    to = models.CharField(max_length=45)
    value = models.CharField(max_length=2)
    gas = models.CharField(max_length=10)
    gasPrice = models.CharField(max_length=12)
    isError = models.CharField(max_length=2)
    txreceipt_status = models.CharField(max_length=2)
    input = models.CharField(max_length=150)
    contractAddress = models.CharField(max_length=150)
    cumulativeGasUsed = models.CharField(max_length=7)
    gasUsed = models.CharField(max_length=7)
    confirmations = models.CharField(max_length=10)

class Block_details(models.Model):
    blockNumber = models.ForeignKey(Blocks, on_delete=models.CASCADE)