package com.mfrp.dao;

public interface DBQueries {
 
String admin_login_verification = "select * from admin_login where admin_username = ? and BINARY admin_password = md5(?)";
String user_login_verification = "select user_id,user_password,status from user_details where user_id = ? and BINARY user_password = md5(?)";
String userdetails = "select * from user_details";
String getuser = "select * from user_details where user_id = ?";
String userregister = "insert into user_details(user_id,user_firstname,user_lastname,user_gender,user_dob,user_address,user_contact_no,user_email_address,nominee_count,insurance_type,insured_amount,max_claimable_amount, user_password, status, max_claim_amount) values(?,?,?,?,?,?,?,?,?,?,?,?,md5(?),?,?)";
String userregister2 = "insert into rejected_user_details(user_firstname,user_lastname,user_gender,user_dob,user_address,user_contact_no,user_email_address,nominee_count,insurance_type,insured_amount,max_claimable_amount) values(?,?,?,?,?,?,?,?,?,?,?)";
String usercheck = "select * from  user_details where user_email_address= ?";
String adminupdateuser = "update user_details set user_firstname=?, user_lastname=?, user_gender=?, user_dob=?,user_address=?,user_contact_no=?,user_email_address=?,nominee_count=?,max_claim_amount=?,insurance_type=?,insured_amount=?,max_claimable_amount=? where user_id=?";
String userupdateprofile = "update user_details set user_firstname=?, user_lastname=?, user_gender=?, user_dob=?,user_address=?,user_contact_no=?,user_email_address=?,nominee_count=?,max_claim_amount=?,insurance_type=?,insured_amount=?,max_claimable_amount=? where user_id=?";
String getuserdetails = "select user_id,user_firstname,user_lastname,user_gender,user_dob,user_address,user_contact_no,user_email_address,nominee_count,max_claim_amount,insurance_type,insured_amount,max_claimable_amount from user_details where user_id = ?";
String getdeathdetails = "select * from death_claim where user_id = ?";
String maxuseridindex = "select max(user_index) from user_details";
String userclaimdetails = "select user_id,user_firstname,user_lastname,nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount,claim_index,claim_status,final_approval_date,user_upload_flag,reject_reason from user_claim_details where user_id = ?";
String userrejectedclaimdetails = "select user_id,nominee_count,insurance_type,max_claim_amount,request_date,claim_reason,final_claim_amount,claim_index,reject_reason from rejected_user_claims where user_id = ?";
String userclaimrequest = "insert into user_claim_details(user_id,user_firstname,user_lastname,nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount) values(?,?,?,?,?,?,?,?,?)";
String userclaimcheck = "select user_id,claim_reason from user_claim_details where user_id = ? and claim_reason = ? and claim_status is null";
String userfileupload = "update user_claim_details set claim_documents = ? , user_upload_flag = ? where claim_index = ?";
String generatepdf = "select user_id,user_firstname,user_lastname,insurance_type,request_date,claim_reason,final_claim_amount,final_approval_date from user_claim_details where claim_index = ?";
String generatepdf2 = "select death_date, death_reason, nominee_1, nominee_2, nominee_3 from death_claim, user_claim_details where claim_index = ? and death_claim.user_id = user_claim_details.user_id";
String deleteuser = "delete from user_details where user_id = ?";
String deleteuser2 = "UPDATE rejected_user_details SET status = 'no' where user_email_address in (select user_details.user_email_address from user_details where user_id = ? and user_details.user_email_address = rejected_user_details.user_email_address)";
String approveuser = "UPDATE user_details SET status= ? WHERE user_id = ?";
String approveuser2 = "delete from rejected_user_details WHERE user_email_address in (select user_details.user_email_address from user_details where user_id = ? and user_details.user_email_address = rejected_user_details.user_email_address)";
String approveclaim = "UPDATE user_claim_details SET claim_status= ? WHERE claim_index = ?";
String approvedocuments = "update user_claim_details set user_upload_flag = ?, final_approval_date = ?, reject_reason = ? where claim_index=?";
String deleteclaim = "delete from user_claim_details where claim_index=?";
String deleteclaimfromdeath = "delete from death_claim where user_id = (select * from (select d.user_id from user_claim_details u, death_claim d where u.user_id = d.user_id and u.claim_index = ? ) as p)";
String rejectdocuments = "update user_claim_details set user_upload_flag = ?, reject_reason=? where claim_index=?";
String getpendingusers = "select user_id,user_firstname,user_lastname,user_gender,user_dob,user_address,user_contact_no,user_email_address,nominee_count,insurance_type,insured_amount,max_claimable_amount,max_claim_amount from user_details u where u.status is null";
String getallusers = "select user_id,user_firstname,user_lastname,user_gender,user_dob,user_address,user_contact_no,user_email_address,nominee_count,insurance_type,insured_amount,max_claimable_amount,max_claim_amount from user_details where status = 'yes'";
String getrejectedusers = "select user_firstname,user_lastname,user_gender,user_dob,user_address,user_contact_no,user_email_address,nominee_count,insurance_type,insured_amount,max_claimable_amount from rejected_user_details where status = 'no'";
String getpendingclaims = "select user_id,user_firstname,user_lastname,nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount,claim_index from user_claim_details u where u.claim_status is null";
String getdeathclaims = "select d.user_id, d.death_date,d.death_reason,d.nominee_1,d.nominee_2,d.nominee_3 from death_claim d, user_claim_details u where u.user_id =d.user_id and u.claim_status is null";
String getrejectedclaims = "select user_id,user_firstname,user_lastname,nominee_count,insurance_type,max_claim_amount,request_date,claim_reason,final_claim_amount,claim_index,reject_reason from rejected_user_claims";
String getapprovedclaims = "select user_id,user_firstname,user_lastname,nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount,claim_index from user_claim_details u where u.claim_status ='Approved'";
String searchallclaims = "select user_id,user_firstname,user_lastname,nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount,claim_index,claim_status from user_claim_details";
String getdeathclaimsforapproved = "select d.user_id, d.death_date,d.death_reason,d.nominee_1,d.nominee_2,d.nominee_3 from death_claim d, user_claim_details u where u.user_id =d.user_id and u.claim_status = 'Approved'";
String getdeathclaimsforapproved2 = "select d.user_id, d.death_date,d.death_reason,d.nominee_1,d.nominee_2,d.nominee_3 from death_claim d, user_claim_details u where u.user_id =d.user_id and u.claim_index = ?";
String finalclaimprocess = "select user_id,user_firstname,user_lastname,insurance_type,request_date,claim_reason,final_claim_amount,claim_index,claim_documents from user_claim_details where user_upload_flag=1";
String approvedclaims = "select user_id,user_firstname,user_lastname,nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount,claim_index from user_claim_details  where user_upload_flag=2";
String getrejectedClaims = "select user_id,user_firstname,user_lastname,nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount,claim_index,reject_reason from user_claim_details where claim_index=?";
String rejectedClaims = "insert into rejected_user_claims(user_id,user_firstname,user_lastname, nominee_count,max_claim_amount,insurance_type,request_date,claim_reason,final_claim_amount,claim_index,reject_reason) values(?,?,?,?,?,?,?,?,?,?,?)";
String deathclaim_3 = "insert into death_claim (user_id,death_date,death_reason,nominee_1,nominee_2,nominee_3) values(?,?,?,?,?,?)";
String deathclaim_2 = "insert into death_claim (user_id,death_date,death_reason,nominee_1,nominee_2) values(?,?,?,?,?)";
String deathclaim_1 = "insert into death_claim (user_id,death_date,death_reason,nominee_1) values(?,?,?,?)";

}