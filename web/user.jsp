<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="icon" type="image/png" href="img/logo1.png">
        <script src="https://kit.fontawesome.com/c1e0573822.js" crossorigin="anonymous"></script>
        <style>
            body {
                background-color: #f5f5f5; 
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }

            .amount {
                margin-top: 30px;
                text-align: center;

            }
            row button{
                border-radius: 7px;
                background-color: lightsteelblue;
                color: white;
                border: none;
                height: 40px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/menu.jsp" />


    </div>
    <div class="container rounded bg-white mt-5 mb-5" id="profile" >
        <div class="row"  >
            <div class="col-md-6 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="img/images.png"><span class="font-weight-bold">${sessionScope.usersession.getUsername()}</span><span class="text-black-50">${sessionScope.usersession.getEmail()}</span><span> </span></div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile information</h4>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-12"><label class="labels">Username</label><input type="text" class="form-control" value="${sessionScope.usersession.getUsername()}" readonly></div>
                    </div>
                    <div class="row mt-3">

                        <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" value="${sessionScope.usersession.getEmail()}" readonly></div> <br>
                    </div> 
                    
                    <div class="row mt-4">

                        <div class="col-md-12"><label class="labels">Password</label><br><input type="text" id="textToHide" value="${sessionScope.usersession.getPassword()}" readonly> <br>
                        <input type="checkbox" value="Show Password" id="hideTextCheckbox" >Show Password</div>
                    </div> 
                    <div class="mt-5 text-center"><button style="border-radius: 7px;background-color: #0076BE;" class="btn btn-primary profile-button" type="button" onclick="update()">Update Profile Here</button></div>

                </div>
            </div>

        </div>
    </div>
    <div class="container rounded bg-white mt-5 mb-5" id="userform" style="display: none">
        <div class="row" >
            <div class="col-md-6 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="img/images.png"><span class="font-weight-bold">${sessionScope.usersession.getUsername()}</span><span class="text-black-50">${sessionScope.usersession.getEmail()}</span><span> </span></div>
                <br>
                <div class="text-center"><button style="border-radius: 7px; background-color:  #0076BE; color: white;"onclick="back()"  >Back to profile</button></div>
                
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <form action="MainController?action=userupdate" method="POST" onsubmit="return savevalue()" >
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Profile Settings</h4>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-"><label class="labels">Username</label><input type="text" class="form-control" name="username" placeholder="Enter your Username" value="${sessionScope.usersession.getUsername()}"  required></div>
                        </div>
                        <div class="row mt-3">

                            <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" name="email" placeholder="Enter your email" value="${sessionScope.usersession.getEmail()}" required></div>
                            <div class="col-md-12"><label class="labels">Old Password</label><input type="text" class="form-control" id="textToHideedit" placeholder="Old password" value="${sessionScope.usersession.getPassword()}" readonly ><input type="checkbox" value="Show Password" id="hideTextCheckboxedit">Show Password</div>
                            <div class="col-md-12"><label class="labels">New Password</label><input type="password" class="form-control" name="password" id="newpass" placeholder="New password" value="${sessionScope.usersession.getPassword()}" required ></div>
                            <div class="col-md-12"><label class="labels">Confirm Password</label><input type="password" class="form-control" name="passwordcheck" id="checknewpass" placeholder="Enter again your password" value="${sessionScope.usersession.getPassword()}" required ></div>
                            <div class="col-md-12"><label class="labels" id='incorrect' style="color: red"></label></div>
                        </div> 
                        <div class="mt-5 text-center"><button style="border-radius: 7px;
                                                              background-color:  #0076BE;"  class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                    </form>

                </div>
            </div>

        </div>
    </div>
    <jsp:include page="/footer.jsp" />
</body>
<script>
    function back() {
        let file = document.getElementById("profile");
        file.style.display = 'block';
        let editfile = document.getElementById("userform");
        editfile.style.display = 'none';
    }
    function update() {
        let file = document.getElementById("profile");
        file.style.display = 'none';
        let editfile = document.getElementById("userform");
        editfile.style.display = 'block';
    }



    const hideTextCheckbox = document.getElementById('hideTextCheckbox');
    const textToHideInput = document.getElementById('textToHide');
    const originalText = textToHideInput.value;
    textToHideInput.value = originalText.replace(/./g, '●');
    hideTextCheckbox.addEventListener('change', function () {
        if (this.checked) {
            textToHideInput.value = originalText;
        } else {

            textToHideInput.value = originalText.replace(/./g, '●');
        }
    });

    const hideTextCheckboxedit = document.getElementById('hideTextCheckboxedit');
    const textToHideInputedit = document.getElementById('textToHideedit');
    const originalTextedit = textToHideInputedit.value;

    textToHideInputedit.value = originalTextedit.replace(/./g, '●');
    hideTextCheckboxedit.addEventListener('change', function () {
        if (this.checked) {
            textToHideInputedit.value = originalTextedit;
        } else {

            textToHideInputedit.value = originalTextedit.replace(/./g, '●');
        }
    });


    function savevalue() {
        let pass = document.getElementById("newpass").value;
        let confirm = document.getElementById("checknewpass").value;

        // So sánh với giá trị gốc
        if (pass !== confirm) {
            document.getElementById("incorrect").innerHTML = "You didn't confirm new password correctly";
            return false;
        }
        document.getElementById("incorrect").innerHTML = "";

        // Gán giá trị gốc cho thuộc tính value của newpass và checknewpass
        passwordInput.value = originalNewPass;
        passwordeditInput.value = originalCheckNewPass;


        return true;
    }
</script>
</html>
