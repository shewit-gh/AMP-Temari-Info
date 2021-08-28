const routes = require('./routes')
const express=require('express');
const mongoose = require('mongoose');

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());


UniversityRouter =require('./routes/University');
InstituteRouter = require ('./routes/Institute');
DepartmentRouter =require('./routes/Department')
UserRouter = require ('./routes/User')
CommentRouter =require('./routes/Comment')
RatingRouter = require( './routes/Rating');

app.use("/api/University", UniversityRouter);
app.use("/api/Institute", InstituteRouter);
app.use("/api/Department", DepartmentRouter);
app.use("/api/User", UserRouter);
app.use("/api/Comment", CommentRouter);
app.use("/api/Rating", RatingRouter);


//before runing make sure to start your mongodb database by using:
//the command :"net start MongoDB" on cmd adminstrator 
//to stop use : "net stop MongoDB" on cmd adminstrator 


const DB_URI = 'mongodb://localhost:27017/temarInfo'

mongoose.connect(DB_URI).then(() => {
    app.listen(3000, () => console.log('Server running...'));
})
.catch((err) => console.log('Error occurred while connecting', err));


module.exports.app = app

