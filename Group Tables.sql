create table Customer(
customerID Number,
name Varchar(50),
address Varchar(250),
zipcode Number,
state Varchar(50),
email Varchar(50),
credit Number,
primary key (customerID)
);

create table Discounts(
discountID NUMBER,
discountDescription Varchar(500),
discountType NUMBER,
discountAmount Number,
primary key (discountID)
);

create table Salestax(
StateID NUMBER,
State Varchar(50),
TaxRate NUMBER,
primary key (StateID)
);
 
create table Categories(
CategoryID NUMBER,
CategoryName Varchar(50),
primary key (CategoryID)
);

create table Restaurants(
restaurantID NUMBER,
restaurantName Varchar(100),
address Varchar(500),
phoneNumber Number,
currentstatus Varchar(50),
zipCode Number,
state VARCHAR(50),
averageWaitTime Number,
averageReviewScore NUMBER,
primary key (restaurantID)
);

create table RestaurantCategories(
restaurantID NUMBER,
CategoryID NUMBER,
foreign key (restaurantId) REFERENCES Restaurants(restaurantId),
foreign key (CategoryID) REFERENCES Categories(CategoryID)
);

create table Fooditems(
DishID NUMBER,
RestaurantID Number,
DishName VARCHAR(50),
Price Number,
primary key (DishID),
foreign key (restaurantId) REFERENCES Restaurants(restaurantId)
);

create table Review(
reviewId NUMBER,
customerId NUMBER,
restaurantId NUMBER,
reviewdate DATE,
reviewscore NUMBER,
comments VARCHAR(200),
primary key (reviewId),
foreign key (customerId) REFERENCES Customer(customerId),
foreign key (restaurantId) REFERENCES Restaurants(restaurantId)
);

create table Cart(
cartId NUMBER,
customerId NUMBER,
restaurantId NUMBER,
status VARCHAR(50),
primary key (cartId),
foreign key (customerId) REFERENCES Customer(customerId),
foreign key (restaurantId) REFERENCES Restaurants(restaurantId)
);

create table CartDetails(
cartdetailsId NUMBER,
cartId NUMBER,
restaurantId NUMBER,
dishId NUMBER,
quantity Number,
primary key (cartdetailsId),
foreign key (cartId) REFERENCES Cart(cartId),
foreign key (restaurantId) REFERENCES Restaurants(restaurantId),
foreign key (dishId) REFERENCES FoodItems(dishId)
);

create table Orders(
orderId NUMBER,
customerId NUMBER,
restaurantId NUMBER,
ordertime TIMESTAMP,
deliverytime TIMESTAMP,
estimatedtime TIMESTAMP,
status VARCHAR(50),
paymentstatus varchar(50),
totalcost NUMBER,
deliverymethod NUMBER,
primary key (orderId),
foreign key (customerId) REFERENCES Customer(customerId),
foreign key (restaurantId) REFERENCES Restaurants(restaurantId)
);

create table OrderDetails(
orderdetailsId NUMBER,
orderId NUMBER,
cartId NUMBER,
primary key (orderdetailsId),
foreign key (orderId) REFERENCES Orders(orderId),
foreign key (cartId) REFERENCES Cart(cartId)
);

create table PaymentRecords(
paymentId NUMBER,
customerId NUMBER,
paymenttime TIMESTAMP,
orderId NUMBER,
paymentamount NUMBER,
paymentmethod VARCHAR(50),
primary key (paymentId),
foreign key (customerId) REFERENCES Customer(customerId),
foreign key (orderId) REFERENCES Orders(orderId)
);

create table Message(
messageId NUMBER,
customerId NUMBER,
messagetime TIMESTAMP,
messagebody VARCHAR(500),
primary key (messageId),
foreign key (customerId) REFERENCES Customer(customerId)
);

select * from customer;
select * from discounts;
select * from salestax;
select * from restaurants;
select * from restaurantcategories;
select * from categories; 
select * from fooditems;
select * from review;
select * from cart;
select * from cartdetails;
select * from orders;
select * from orderdetails;
select * from paymentrecords;
select * from message;

commit;

