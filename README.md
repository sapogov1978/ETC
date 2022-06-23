# Ethereum transactions crawler

~~Once upon a time...~~ no, no that. ~~A long time ago in a galaxy far far away...~~ not that even more. :)

I applied for IT Intership in Trace Lab. With [this resume](/readme_files/konstantin_sapogov_resume.pdf) and get an answer from company

![](/readme_files/mailfromtracelabs.png)

I don't know who Alexandar is (my name is Konstantin) and could be a Full Stack Engineer as an Intern, but... as I said in my resume - I'm a fast learner and... but... damn... **Challenge accepted.** Thanks Alexandar, and thanks to the guys from Trace Lab.

## Task
<blockquote>

Create an application that will allow a user to view transaction data from the Ethereum blockchain associated with a specific wallet address ***W*** that the user inputs, starting with block ***B***. The application should get information on: wallets (addresses) and amounts of ETH associated with transactions made to and from the given wallet W and show them in a simple human-readable way (ideally, through a web page). 

The application should collect and display ***ALL*** transaction data starting from the given block ***B***. 

__Example: 
If a user requests to view transactions associated with the address 0xaa7a9ca87d3694b5755f213b5d04094b8d0f0a6f from block 9000000 to the current block, your application should be able to crawl and visualize all transaction data (addresses that have sent and received tokens from the address 0xaa7a9ca87d3694b5755f213b5d04094b8d0f0a6f, and how much ETH was used for a given transaction) in that period of time.__

**For bonus points:**

- Given a date in YYYY-MM-DD format, the program should return the exact value of ETH that was available on the given address at YYYY-MM-DD 00:00 UTC time.

- Do the same task above to include tokens amounts (other than ETH)

**Instructions**

Use any technology you would like/are familiar with (language, database)

Please include instructions on how to run the project together with the code (so our team members can run it in one of our environments)

A list of officially available ethereum clients can be found here: http://ethdocs.org/en/latest/connecting-to-clients/. Other implementations can be found on the web. Additionally, you can utilize an API from a service such as https://etherscan.io/apis or register an account on infura.io service to access data from the blockchain directly.

See https://etherscan.io/ for an example of how data can be visualized.

</blockquote>

10 days... 1 has already passed. The last time I saw HTML it was v3 and the guys were making the tables by hand. Now it's v5 and I don't know anything about it.

Blockchain and Ethereum - who are these guys? I didn't hide in the cave, but it was somewhere else, now it's time to run after it.

O'right, lets rock-n-roll step by step.

# Day00
Spent. I saw the mail only the next day. My luck.

# Day01
I read a lot about Ethereum, transactions, blocks, API. **Preliminary solution: Python/Django, PostgreSQL in a Docker container.** Connected Bootstrap, read the HTML specification. All this resulted in an index file with a basic form for entering the wallet address and the starting block. Not much, but for now, as it is.

# Day02
Spent. Administrative day for immigration and visa questions.

# Day03

___To be continued...___
