#create customer 1
customer1 = Customer.create(rut: "12345678")

# Create deposits for the customer1
customer1.deposits.create(balance: 100000, date: '2023-07-17')
customer1.deposits.create(balance: 5000, date: '2023-07-18')

#create customer 2
customer2 = Customer.create(rut: "87654321")

# Create deposits for the customer1
customer2.deposits.create(balance: 200000, date: '2023-07-19')
customer2.deposits.create(balance: 6000, date: '2023-07-20')
