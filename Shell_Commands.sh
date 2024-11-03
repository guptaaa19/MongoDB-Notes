Microsoft Windows [Version 10.0.22631.3958]
(c) Microsoft Corporation. All rights reserved.

D:\SQL>mongosh %MDB_CONNECTION_STRING%;
Current Mongosh Log ID: 66ae0df90f31a0eaa2228fb4
Connecting to:          mongodb://localhost:27017/?appName=mongodb-vscode%3B&directConnection=true&serverSelectionTimeoutMS=2000
Using MongoDB:          7.0.11
Using Mongosh:          2.2.15

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2024-08-02T11:24:49.292+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted

test> show dbs
Database    108.00 KiB
Database60   60.00 KiB
Database61  108.00 KiB
admin        40.00 KiB
config      108.00 KiB
local        88.00 KiB
test> use admin
switched to db admin
admin> use school
switched to db school
school> show dbs
Database    108.00 KiB
Database60   60.00 KiB
Database61  108.00 KiB
admin        40.00 KiB
config      108.00 KiB
local        88.00 KiB
school> db.createCollection("Students")
{ ok: 1 }
school> show dbs
Database    108.00 KiB
Database60   60.00 KiB
Database61  108.00 KiB
admin        40.00 KiB
config      108.00 KiB
local        88.00 KiB
school        8.00 KiB
school> db.dropDatabase()
{ ok: 1, dropped: 'school' }
school> show dbs
Database    108.00 KiB
Database60   60.00 KiB
Database61  108.00 KiB
admin        40.00 KiB
config      108.00 KiB
local        88.00 KiB
school> db.students.insertOne({ name:"Spongebo", age:30, gpa:3.2})
{
  acknowledged: true,
  insertedId: ObjectId('66ae3befb82e737d5d228fb5')
}
school> db.students.find()
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  }
]
school> db.students.insertMany([{name:"Manu", age:20, gpa:3.9}, {name:"Piku" , age:19, gpa:3.0}, {name:"Helena", age: 22, gpa:2.7}])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66ae3d26b82e737d5d228fb6'),
    '1': ObjectId('66ae3d26b82e737d5d228fb7'),
    '2': ObjectId('66ae3d26b82e737d5d228fb8')
  }
}
school> db.students.find()
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  }
]
# DATA TYPES IN MONGODB:
school> db.students.insertOne({ name:"Larry", // string
  age:32,  //  integers
  gpa : 2.1,  //  double
  fullTime: false,  // boolean
  registerDate: new Date(),  //  Data Object
  graduationDate: null,  //  null (no value)
  courses: ["Biology" , "Chemistry", "Calculus"],  //  Arrays  
  address: { street: "123 Fake St.", city:"Washington DC", zip: 123456}  //  Nested documents
})
{
  acknowledged: true,
  insertedId: ObjectId('66ae4052b82e737d5d228fb9')
}

// SORTING
// 1 :  asending order 
// -1 : desending order

school> db.students.find().sort({ name: 1})
[
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  }
]
school> db.students.find().sort({ name: -1})
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  }
]
school> db.students.find().sort({ gpa : 1})
[
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  }
]
school> db.students.find().sort({ gpa : -1})
[
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]

// LIMIT 
// get the no. of documnet, you would like to be returned as the documnet
// documnets are sorted by orderid and returned in the same manner
school> db.students.find().limit(1)
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  }
]
school> db.students.find().limit(3)
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  }
]

// COMBINE SORT & LIMIT METHOD

school> db.students.find().sort({ name: 1})
[
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  }
]
school> db.students.find().sort({ name: -1})
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  }
]
school> db.students.find().sort({ gpa : 1})
[
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  }
]
school> db.students.find().sort({ gpa : -1})
[
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]
school> db.students.find().limit(1)
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  }
]
school> db.students.find().limit(3)
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3
  }
]
school> db.students.find().sort({gpa: -1}).limit(1)
[
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9
  }
]
school> db.students.find().sort({gpa: 1}).limit(1)
[
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]

//PASSING ARGUMENTS IN FIND METHOD
.find({query}, {projection}) 
query parameter is very similar to where clause in SQL -> WHERE clause 
projection : return the columns that has been specified -> SELECT clause

school> db.students.find({}, {name : true})
[
  { _id: ObjectId('66ae3befb82e737d5d228fb5'), name: 'Spongebo' },
  { _id: ObjectId('66ae3d26b82e737d5d228fb6'), name: 'Manu' },
  { _id: ObjectId('66ae3d26b82e737d5d228fb7'), name: 'Piku' },
  { _id: ObjectId('66ae3d26b82e737d5d228fb8'), name: 'Helena' },
  { _id: ObjectId('66ae4052b82e737d5d228fb9'), name: 'Larry' }
]
school> db.students.find({}, {gpa : 0})
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebo',
    age: 30
  },
  { _id: ObjectId('66ae3d26b82e737d5d228fb6'), name: 'Manu', age: 20 },
  { _id: ObjectId('66ae3d26b82e737d5d228fb7'), name: 'Piku', age: 19 },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]
school> db.students.find({}, {_id: false, name: true, gpa : true})
[
  { name: 'Spongebo', gpa: 3.2 },
  { name: 'Manu', gpa: 3.9 },
  { name: 'Piku', gpa: 3 },
  { name: 'Helena', gpa: 2.7 },
  { name: 'Larry', gpa: 2.1 }
]


// filterOne( filter, update )

school> db.students.updateOne({name: "Spongebo"}, {$set:{name: "Spongebob"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
school> db.students.updateOne({name: "Spongebo"}, {$set:{fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
school> db.students.find({name: "Spongebob"})
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]
school> db.students.updateMany({},{$set: {fullTime: false}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 5,
  modifiedCount: 4,
  upsertedCount: 0
}
school> db.students.find()
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]

// UNSET

school> db.studets.updateOne({ name: "Piku"}, {$unset:{fullTime: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
school> db.studets.updateOne({ name: "Helena"}, {$unset:{fullTime: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}

school> db.students.find()
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]

school> db.students.updateMany({fullTime:{ $exists: false}}, {$set:{fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
school> db.students.find()
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  },
  {
    _id: ObjectId('66ae4052b82e737d5d228fb9'),
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: ISODate('2024-08-03T14:36:02.211Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]


// DELETE

school> db.students.deleteOne({name: "Larry"})
{ acknowledged: true, deletedCount: 1 }
school> db.students.find()
[
  {
    _id: ObjectId('66ae3befb82e737d5d228fb5'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb6'),
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb7'),
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: ObjectId('66ae3d26b82e737d5d228fb8'),
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  }
]
school> db.students.deleteMany({fullTime: false})
{ acknowledged: true, deletedCount: 4 }

school> db.students.deleteMany({register:{$exists: false}})
{ acknowledged: true, deletedCount: 0 }

// COMPARISION QUERY OPERATOR
comparisons operators return data based on value comparisons

school> db.students.find({name: {$ne:"Spongebob"}})
[
  {
    _id: '66ae3d26b82e737d5d228fb6',
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb8',
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  },
  {
    _id: '66ae4052b82e737d5d228fb9',
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: '2024-08-03T14:36:02.211Z',
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]
school> db.students.find({age: {$lt:20}})
[
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  }
]
school> db.students.find({age: {$gt:25}})
[
  {
    _id: '66ae3befb82e737d5d228fb5',
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: '66ae4052b82e737d5d228fb9',
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: '2024-08-03T14:36:02.211Z',
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]
school> db.students.find({age: {$lte:25}})
[
  {
    _id: '66ae3d26b82e737d5d228fb6',
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb8',
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  }
]
school> db.students.find({gpa:{$gte: 3,  $lte:4}})
[
  {
    _id: '66ae3befb82e737d5d228fb5',
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb6',
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  }
]
school> db.students.find({name:{$in:["Spongebob" , "Manu", "Larry"]}})
\[
  {
    _id: '66ae3befb82e737d5d228fb5',
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb6',
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: '66ae4052b82e737d5d228fb9',
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: '2024-08-03T14:36:02.211Z',
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]
school> db.students.find({name:{$nin:["Spongebob" , "Manu", "Larry"]}})
[
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb8',
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  }
]

// LOGICAL QUERY OPERATORS
returns data based on expressions that evaluate to true or false
$and $not $nor $or


school> db.students.find({$and: [ {fullTime:true}, {age:{$lte:22}}]})

school> db.students.find({$or: [ {fullTime:true}, {age:{$lte:22}}]})
[
  {
    _id: '66ae3d26b82e737d5d228fb6',
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb8',
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  }
]
school> db.students.find({$or: [ {fullTime:false}, {age:{$lte:25}}]})
[
  {
    _id: '66ae3befb82e737d5d228fb5',
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb6',
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: 19,
    gpa: 3,
    fullTime: false
  },
  {
    _id: '66ae3d26b82e737d5d228fb8',
    name: 'Helena',
    age: 22,
    gpa: 2.7,
    fullTime: false
  },
  {
    _id: '66ae4052b82e737d5d228fb9',
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: '2024-08-03T14:36:02.211Z',
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]
school> db.students.find({$nor: [ {fullTime:false}, {age:{$lte:25}}]})

school> db.students.find({$nor: [ {fullTime:true}, {age:{$lte:25}}]})
[
  {
    _id: '66ae3befb82e737d5d228fb5',
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: '66ae4052b82e737d5d228fb9',
    name: 'Larry',
    age: 32,
    gpa: 2.1,
    fullTime: false,
    registerDate: '2024-08-03T14:36:02.211Z',
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Washington DC', zip: 123456 }
  }
]
school> db.students.find({ age:{$not:{$gte: 20}}})
[
  {
    _id: '66ae3d26b82e737d5d228fb7',
    name: 'Piku',
    age: null,
    gpa: 3,
    fullTime: false
  }
]


// INDEXES
supports efficient execution of queries 
uses B-Tree-> slows insert, update and remove operations because we have to update the B-Tree -> use indexes wisely 
Indexes in MongoDB support the efficient execution of queries by creating a data structure that enhances the speed of data retrieval operations. This is particularly useful for large datasets.

Indexes are implemented using a data structure known as a B-Tree, which allows for fast search operations. However, using indexes comes with some trade-offs:

Insert, Update, and Remove Operations: These operations can become slower because every time a document is modified, the B-Tree must also be updated to reflect these changes. This additional overhead can impact performance.
Storage: Indexes consume additional storage space.
Therefore, it is crucial to use indexes judiciously. Over-indexing can lead to increased storage requirements and slower write operations, while under-indexing can result in slower read operations.

In summary:

Indexes: Enhance query performance by allowing quick lookups.
B-Tree: The underlying structure of indexes, enabling efficient searching.
Trade-offs: Slower write operations and increased storage usage.
Using indexes wisely involves balancing the need for fast queries with the performance impact on write operations and storage.

// most basic difference between a B-Tree and a Binary Tree is that a B-Tree is used for data storage on a disk, whereas a Binary Tree is used for data storage in RAM.


school> db.students.find({name:"Manu"}).explain("executionStats")
{
  explainVersion: '1',
  queryPlanner: {
    namespace: 'school.students',
    indexFilterSet: false,
    parsedQuery: { name: { '$eq': 'Manu' } },
    queryHash: 'A2F868FD',
    planCacheKey: 'A2F868FD',
    maxIndexedOrSolutionsReached: false,
    maxIndexedAndSolutionsReached: false,
    maxScansToExplodeReached: false,
    winningPlan: {
      stage: 'COLLSCAN',
      filter: { name: { '$eq': 'Manu' } },
      direction: 'forward'
    },
    rejectedPlans: []
  },
  executionStats: {
    executionSuccess: true,
    nReturned: 1,
    executionTimeMillis: 0,
    totalKeysExamined: 0,
    totalDocsExamined: 5,
    executionStages: {
      stage: 'COLLSCAN',
      filter: { name: { '$eq': 'Manu' } },
      nReturned: 1,
      executionTimeMillisEstimate: 0,
      works: 6,
      advanced: 1,
      needTime: 4,
      needYield: 0,
      saveState: 0,
      restoreState: 0,
      isEOF: 1,
      direction: 'forward',
      docsExamined: 5
    }
  },
  command: { find: 'students', filter: { name: 'Manu' }, '$db': 'school' },
  serverInfo: {
    host: 'DESKTOP-F9H0BN7',
    port: 27017,
    version: '7.0.11',
    gitVersion: 'f451220f0df2b9dfe073f1521837f8ec5c208a8c'
  },
  serverParameters: {
    internalQueryFacetBufferSizeBytes: 104857600,
    internalQueryFacetMaxOutputDocSizeBytes: 104857600,
    internalLookupStageIntermediateDocumentMaxSizeBytes: 104857600,
    internalDocumentSourceGroupMaxMemoryBytes: 104857600,
    internalQueryMaxBlockingSortMemoryUsageBytes: 104857600,
    internalQueryProhibitBlockingMergeOnMongoS: 0,
    internalQueryMaxAddToSetBytes: 104857600,
    internalDocumentSourceSetWindowFieldsMaxMemoryBytes: 104857600,
    internalQueryFrameworkControl: 'trySbeRestricted'
  },
  ok: 1
}
school> db.students.createIndex({name: 1})
name_1
school> db.students.find({name:"Manu")
Uncaught:
SyntaxError: Unexpected token, expected "," (1:29)

> 1 | db.students.find({name:"Manu")
    |                              ^
  2 |

school> db.students.find({name:"Manu"})
[
  {
    _id: '66ae3d26b82e737d5d228fb6',
    name: 'Manu',
    age: 20,
    gpa: 3.9,
    fullTime: false
  }
]
school> db.students.find({name:"Manu"}).explain("executionStats")
{
  explainVersion: '1',
  queryPlanner: {
    namespace: 'school.students',
    indexFilterSet: false,
    parsedQuery: { name: { '$eq': 'Manu' } },
    queryHash: 'A2F868FD',
    planCacheKey: 'A3E454E0',
    maxIndexedOrSolutionsReached: false,
    maxIndexedAndSolutionsReached: false,
    maxScansToExplodeReached: false,
    winningPlan: {
      stage: 'FETCH',
      inputStage: {
        stage: 'IXSCAN',
        keyPattern: { name: 1 },
        indexName: 'name_1',
        isMultiKey: false,
        multiKeyPaths: { name: [] },
        isUnique: false,
        isSparse: false,
        isPartial: false,
        indexVersion: 2,
        direction: 'forward',
        indexBounds: { name: [ '["Manu", "Manu"]' ] }
      }
    },
    rejectedPlans: []
  },
  executionStats: {
    executionSuccess: true,
    nReturned: 1,
    executionTimeMillis: 0,
    totalKeysExamined: 1,
    totalDocsExamined: 1,
    executionStages: {
      stage: 'FETCH',
      nReturned: 1,
      executionTimeMillisEstimate: 0,
      works: 2,
      advanced: 1,
      needTime: 0,
      needYield: 0,
      saveState: 0,
      restoreState: 0,
      isEOF: 1,
      docsExamined: 1,
      alreadyHasObj: 0,
      inputStage: {
        stage: 'IXSCAN',
        nReturned: 1,
        executionTimeMillisEstimate: 0,
        works: 2,
        advanced: 1,
        needTime: 0,
        needYield: 0,
        saveState: 0,
        restoreState: 0,
        isEOF: 1,
        keyPattern: { name: 1 },
        indexName: 'name_1',
        isMultiKey: false,
        multiKeyPaths: { name: [] },
        isUnique: false,
        isSparse: false,
        isPartial: false,
        indexVersion: 2,
        direction: 'forward',
        indexBounds: { name: [ '["Manu", "Manu"]' ] },
        keysExamined: 1,
        seeks: 1,
        dupsTested: 0,
        dupsDropped: 0
      }
    }
  },
  command: { find: 'students', filter: { name: 'Manu' }, '$db': 'school' },
  serverInfo: {
    host: 'DESKTOP-F9H0BN7',
    port: 27017,
    version: '7.0.11',
    gitVersion: 'f451220f0df2b9dfe073f1521837f8ec5c208a8c'
  },
  serverParameters: {
    internalQueryFacetBufferSizeBytes: 104857600,
    internalQueryFacetMaxOutputDocSizeBytes: 104857600,
    internalLookupStageIntermediateDocumentMaxSizeBytes: 104857600,
    internalDocumentSourceGroupMaxMemoryBytes: 104857600,
    internalQueryMaxBlockingSortMemoryUsageBytes: 104857600,
    internalQueryProhibitBlockingMergeOnMongoS: 0,
    internalQueryMaxAddToSetBytes: 104857600,
    internalDocumentSourceSetWindowFieldsMaxMemoryBytes: 104857600,
    internalQueryFrameworkControl: 'trySbeRestricted'
  },
  ok: 1
}
school> db.students.getIndexes()
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { name: 1 }, name: 'name_1' }
]
school> db.students.dropIndex("name_1")
{ nIndexesWas: 2, ok: 1 }
school> db.students.getIndexes()
[ { v: 2, key: { _id: 1 }, name: '_id_' } ]

// COLLECTIONS

school> show collections
students
school> db.createCollection("teachers")
{ ok: 1 }
school> show collections
students
teachers
school> db.createCollection("teachers", {capped:true, size: 1000*1024, max:100, autoIndexId:false})
MongoServerError[NamespaceExists]: namespace school.teachers already exists, but with different options: { uuid: UUID("4fdb7d1d-6353-4479-a549-48634c95eaa4") }
school> db.createCollection("faculty", {capped:true, size: 1000*1024, max:100, autoIndexId:false})
{ ok: 1 }
school> show collections
faculty
students
teachers
school> db.drop("teachers")
TypeError: db.drop is not a function
school> db.teachers.drop()
true

  
