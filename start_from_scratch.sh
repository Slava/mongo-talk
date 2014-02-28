#!/bin/bash
killall -9 mongod
rm -rf ./db
mkdir db
./mongod --dbpath ./db > /dev/null 2>&1  &

sleep 2

cat << EOF | ./mongo

db.people.insert({ name: "John Doe", address: { city: "SF", state: "CA"  }  })

db.places.insert({ _id: "A", ratings: [5, 1, 3] })
db.places.insert({ _id: "B", ratings: [2, 4, 9] })
db.places.insert({ _id: "C", ratings: [1] })

db.restaurants.insert({ _id: "A", locations: [[1, 2], [1, 0]] })
db.restaurants.insert({ _id: "B", locations: [[0, 0]] })
db.restaurants.ensureIndex({ locations: "2d" })


EOF

npm install mongodb > /dev/null 2>&1


