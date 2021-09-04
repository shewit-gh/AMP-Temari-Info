const Department = require('../models/DepartmentModel')
const Institute =  require("../models/InstituteModel")
const mongoose = require('mongoose');

const express=require('express');
const { Mongoose } = require('mongoose');
//get all department
function getAll(req,res){
   Department.find().populate("institute_id")
            .exec()
            .then(result=>{
                
                if(result){
                    console.log("all data fetched")
                    res.status(200).json(result)
                }
                else{
                    res.status(404).json({
                    message:"no item inside the database"
                    })
                }
                
            }).
            catch(err=>{
                res.status(500).json({
                    error:err
                })
            })

}
//get department by id
function getById(req,res){
    const id = req.params.dept_id
    Department.findById(id).populate("institute_id")
    .exec()
    .then(result=>{
        if(result){
        console.log("fetched sucssesfully")
        res.status(200).json(result)
        }
        else{
            req.status(404).json({
                message:"no such id"
            })
        }
        

    })
    .catch(err=>{
        console.log(err)
        res.status(500).json({error:"error while fetching from server"})
    })

}
//post
function postt(req,res){
    
    const department = new Department({
        _id:mongoose.Types.ObjectId(),
        dept_name:req.body.dept_name,
        years:req.body.years,
        objective:req.body.objective,
        institute_id:req.body.institute_id
    })
    department.save()
    .then(result=>{Institute.updateOne({_id:req.body.institute_id},{$push:{department_id:department._id}}) .exec()
    res.status(200).json(result)})
           
   
    .catch(error=>{
        res.status(500).json(
            
           {
               message:"error occured while posting",
               error:error
           }
        )
    })
  
   
    
}
//delete by id
function deleteById(req,res){
    const id = req.params.dept_id
    Department.remove({_id: id}).exec()
        .then(result => {
            if(result){
                console.log(result);
                res.status(200).json( result)
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
       
    
}
//update by id
function updateById(res,req){
    const id = req.params.dept_id;
        const UpdateOps = {};
        for (const ops of req.body){
            UpdateOps[ops.propName] = ops.value;
        }
        Department.updateMany({_id:id}, {$set: UpdateOps}).exec()
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



module.exports={getAll,
                getById,
                postt,deleteById,updateById}

