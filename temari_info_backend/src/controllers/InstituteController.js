const express=require('express');
const mongoose = require('mongoose');
const Institute = require('../models/InstituteModel')
const University = require('../models/UniversityModel')


module.exports ={
//GET ALL    
    getAll:(req, res) =>{
        Institute.find().populate("univ_id").populate("department_id").exec()
        .then(result =>{
            console.log(result);
            res.status(200).json({
                message: 'Fetched succefully',
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
        const id = req.params.instId;
        Institute.find({_id:id}).populate("univ_id").populate("department_id").exec()
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
        const inst = Institute.find({_id: id})
        University.updateOne({_id: isnt.univ_id}, {$pull:{institute: inst._id }}).exec();
        Institute.remove({_id: id}).exec()
        .then(result => {
            if(result){
                console.log(result);
                res.status(200).json({
                    message:'Data has been successfully deleted',
                    Deletedata: result
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
        const institute = new Institute({
            _id: new mongoose.Types.ObjectId,
            univ_id: req.body.univ_id,
            inst_name: req.body.inst_name,
            phone: req.body.phone,
            email: req.body.email,
            inst_description: req.body.inst_description

        })
        institute.save()
        .then(result => {
            University.updateOne({_id: req.body.univ_id}, {$push:{institute: institute._id }}).exec();
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
        const id = req.params.instId;
        const UpdateOps = {};
        for (const ops of req.body){
            UpdateOps[ops.propName] = ops.value;
        }
        Institute.updateMany({_id:id}, {$set: UpdateOps}).exec()
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