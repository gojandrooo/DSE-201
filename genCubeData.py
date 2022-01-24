import random

nrOfCategs = 100
nrOfProds = 100000

# customers
with open('last_names.txt', 'r') as f:
	last_names = f.read().splitlines()

with open('first_names.txt', 'r') as f:
	first_names = f.read().splitlines()


custCount = 0
maxIndex = len(first_names) - 1;
with open('customers.csv', 'w') as f:
	f.write("id,fname,lname\n")
	for ln in last_names:
		for k in range(10):
			fn = first_names[random.randrange(maxIndex)]
	 		f.write("{},{},{}\n".format(custCount, fn, ln))
			custCount = custCount + 1

# categs
with open('categories.csv', 'w') as f:
	f.write("id,cname,cdescr\n")
	for cid in range(nrOfCategs):
		f.write("{},C{},Products in this category have properties PSET{}\n".format(cid,cid,cid))


# products
with open('products.csv', 'w') as f:
	f.write("id,pname,price,cid\n")
	for pid in range(nrOfProds):
		dollars = random.randrange(1000)
		cents = random.randrange(100)
		if dollars == 0 and cents == 0:
			cents = 13
		cid = random.randrange(nrOfCategs)
		f.write("{},P{},{}.{},{}\n".format(pid,pid,dollars,cents,cid))

# sales
with open('sales.csv', 'w') as f:
        f.write("id,pid,cid,quantity,discount\n")
	sid = 1
	for cid in range(custCount):
		boughtCnt = random.randrange(20)
		for k in range(boughtCnt):
			quantity = random.randrange(1000)
			discount = random.randrange(100)/100.0
			pid = random.randrange(nrOfProds-1)
			f.write("{},{},{},{},{}\n".format(sid,pid,cid,quantity,discount))
			sid = sid + 1			
