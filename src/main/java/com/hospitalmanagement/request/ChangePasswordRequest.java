package com.hospitalmanagement.request;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class ChangePasswordRequest {
    @Size(min=6, message="Password must be at least 6 characters")
    @NotEmpty(message="Password should not be empty")
    private String oldPassword;
    
    @Size(min=6, message="Password must be at least 6 characters")
    @NotEmpty(message="New password should not be empty")
    private String newPassword;

    @Size(min=6, message="Password must be at least 6 characters")
    @NotEmpty(message="Confirm new password should not be empty")
    private String confirmNewPassword;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmNewPassword() {
        return confirmNewPassword;
    }

    public void setConfirmNewPassword(String confirmNewPassword) {
        this.confirmNewPassword = confirmNewPassword;
    }

}
