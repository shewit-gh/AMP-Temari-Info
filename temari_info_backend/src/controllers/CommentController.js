const express=require('express');
const mongoose=require('mongoose');
const Comment = require('../models/CommentModel');
const University=require('../models/UniversityModel')

module.exports ={
    //GET ALL    
        get:(req, res) =>{
            Comment.find().populate("univ_id").exec()
            .then(result =>{
                console.log(result);
                res.status(200).json({
                    message: 'successfully fetched ',
                    data: result})
            }).catch(err =>{
                console.log(err);
                res.status(500).json({
                    message:'Faced an error while fetching',
                    error: err
                })
            })
        },
    //DELETE
        delete: (req, res)=>{
            const id = req.params.commentId;
            Comment.remove({_id: id}).exec()
            .then(result => {
                if(result){
                    console.log(result);
                    res.status(200).json({
                        message:'Data has been successfully deleted',
                        DeleteData: result
                    })
    
                }else{
                    res.status(404).json({
                        message:'No data to be deleted with the entry provided',
                        
                    }) 
                }
                
            }).catch(err =>{
                console.log(err);
                res.status(500).json({
                    message:'Faced an error while deleting',
                    error: err
                })
            })
           
        },
    //POST
        post: (req, res)=>{
            let date_ob=Date.now();
            const comment = new Comment({
                _id: new mongoose.Types.ObjectId,
                comment:req.body.comment,
                university_id: req.body.university_id,
                user_id: req.body.user_id, 
    
            })
            comment.save()
            .then(result => {
                University.updateOne({_id: req.body.univ_id}, {$push:{comment: comment._id }}).exec();
                res.status(200).json({
                    message:'Posted successfully',
                    PostedData: result
                });
            }).catch(err =>{
                console.log(err);
                res.status(500).json({
                    message:'Faced an error while posting',
                    err: err
                })
    
            })
    
        },
    
     //UPDATE   
        patch: (req, res)=>{
            const id = req.params.commentId;
            const UpdateOps = {};
            for (const ops of req.body){
                UpdateOps[ops.propName] = ops.value;
            }
            Comment.updateMany({_id:id}, {$set: UpdateOps}).exec()
            .then(result =>{
                console.log(result);
                res.status(200).json({
                    message: 'Data updated successfully',
                    UpdatedData: result
                })
            }).catch(err =>{
                console.log(err);
                res.status(500).json({
                    message:'Faced an error while updating',
                    error: err
                })
            })
        }
    
    };