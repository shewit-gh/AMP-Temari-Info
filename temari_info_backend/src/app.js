// const routes = require('./routes')
const express = require('express');
const mongoose = require('mongoose');

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());


UniversityRouter = require('./routes/UniversityRoute');
InstituteRouter = require('./routes/InstituteRoute');
DepartmentRouter = require('./routes/DepartmentRoute')
UserRouter = require('./routes/UserRoute')
CommentRouter = require('./routes/CommentRoute')
RatingRouter = require('./routes/RatingRoute');
AuthRouter = require('./routes/authRoute');
ReportRouter = require('./routes/ReportRoute');


app.use("/api/University", UniversityRouter);
app.use("/api/Institute", InstituteRouter);
app.use("/api/Department", DepartmentRouter);
app.use("/api/User", UserRouter);
app.use("/api/Comment", CommentRouter);
app.use("/api/Rating", RatingRouter);
app.use("/api/auth", AuthRouter);
app.use("/api/Report", ReportRouter);



//before running make sure to start your mongodb database by using:
//the command :"net start MongoDB" on cmd administrator 
//to stop use : "net stop MongoDB" on cmd administrator 


const DB_URI = 'mongodb://localhost:27017/temariInfo'

mongoose.connect(DB_URI).then(() => {
    app.listen(3000, () => console.log('Server running...'));
})
    .catch((err) => console.log('Error occurred while connecting', err));


module.exports.app = app

