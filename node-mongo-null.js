doc = {
  _id: "from node app",
  a: undefined
};

// --------------------------------------------------------------
// Insert the doc into 'things' collection

mongodb = require('mongodb');

mongodb.connect('mongodb://localhost/test', function (err, db) {
  if (err) throw err;
  db.collection('things', function (err, collection) {
    if (err) throw err;
    collection.insert(doc, function (err) {
      if (err) throw err;
      process.exit(0);
    });
  });
});

