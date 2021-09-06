const express=require('express');
const Rating = require('../models/RatingModel');
const University=require('../models/UniversityModel')

module.exports ={
    //GET ALL    
        getAll:(req, res) =>{
            Rating.find().populate("univ_id").exec()
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
    //GET BY ID
        getOne: (req, res)=>{
            const id = req.params.rateId;
            Rating.find({_id:id}).populate("univ_id").exec()
            .then(result =>{
                if(result){
                    console.log(result)
                    res.status(200).json({
                        message: 'Fetched successfully',
                        data: result})
                }else{
                    res.status(404).json({
                        message:'No data with the entry provided',
                        
                    }) 
                }
                
            }).catch(err=>{
                console.log(err);
                res.status(500).json({
                    message:'Faced an error while fetching',
                    error: err
                })
            }) 
            
        },
    //DELETE
        delete: (req, res)=>{
            const id = req.params.instId;
            Rating.remove({_id: id}).exec()
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
            
            const rating = new Rating({
                _id: new mongoose.Types.ObjectId,
                rating:req.body.rating,
                univ_id: req.body.univ_id,
                user_id: req.body.univ_id,
                rating_count: req.body.rating_count,
            })
            rating.save()
            .then(result => {
                University.updateOne({_id: req.body.univ_id}, {$push:{rating: rating._id }}).exec();
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
            const id = req.params.rateId;
            const UpdateOps = {};
            for (const ops of req.body){
                UpdateOps[ops.propName] = ops.value;
            }
            Rating.updateMany({_id:id}, {$set: UpdateOps}).exec()
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