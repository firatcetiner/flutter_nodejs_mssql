const express = require('express');
const app =  new express();
const port = 3000;
const bodyParser = require('body-parser') 
const db = require('./DBConnection.js')

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post('/employee/get_by_companyid', (req, res,err) => {
  db.request("SELECT * FROM Employee where Employee_CompanyID=" + req.body.companyid,
    function(results) {
      res.send(JSON.stringify(results)['recordset'][0])
 })
})

app.get('/employee/get_all', (req, res,err) => {
  db.request("SELECT * FROM Employee",
    function(results) {
      res.send(JSON.stringify(results['recordset']))
 })
})

app.get('/company/get_all', (req, res,err) => {
  db.request("SELECT * FROM Company",
    function(results) {
      res.send(JSON.stringify(results['recordset']))
 })
})


app.post('/individual/sign_up',(req,res,err) => {
  console.dir(req.body.firstname)
  db.request('insert into Individual'
    + '(IndividualSSN, FirstName, LastName, IndividualMail, IndividualPhoneNumber)'
    + 'values(' + req.body.ssn + ',' + req.body.firstname + ',' + req.body.lastname + ',' + req.body.mail + ',' + req.body.phone + ')',
    function(results) {
      res.send(JSON.stringify(results))
    })
})

app.post('/company/sign_up',(req,res,err) => {
  console.dir(req.body.sector)

  db.request("EXEC CompanyInsert_SP "
   +'@TaxNo=' + req.body.taxno + ','
   + '@Sector=' + "'" + req.body.sector + "'" + ','
   + '@CompanyName=' + "'" + req.body.name + "'" + ','
   + '@NumberOfEmployees=' + "'" + req.body.employees + "'" + ','
   + '@NumberOfProjects=' + "'" + req.body.projects + "'" + ';'
   , function(results) {
     res.send(JSON.stringify(results))
   })
})

app.post('/post_test',(req,res,err) => {
  res.send(JSON.stringify(req.body)) 
})


app.listen(port,() => console.log(`Example app listening on port ${port}!`))