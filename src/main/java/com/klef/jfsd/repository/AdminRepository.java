package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, String>
{
    @Query("select a from Admin a where a.username=?1 and a.password=?2")
    public Admin checkAdminLogin(String uname, String pwd);
    
    
}
