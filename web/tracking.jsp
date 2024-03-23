<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Okane Kanri - Tracking</title>
        <link rel="icon" type="image/png" href="img/logo1.png">

        <meta name="generator" content="Mobirise v5.9.13, mobirise.com">
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons2/mobirise2.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">

        <link rel="stylesheet" href="assets/socicon/css/styles.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="preload" href="https://fonts.googleapis.com/css?family=Inter+Tight:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload = null;this.rel = 'stylesheet'">
        <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter+Tight:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
        <link rel="preload" as="style" href="assets/mobirise/css/mbr-additional.css?v=tPj5oE"><link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css?v=tPj5oE" type="text/css">
        <script src="https://kit.fontawesome.com/c1e0573822.js" crossorigin="anonymous"></script>

        <style>
            body {
                background-color: #0076BE;
                color: #333;
            }
            .container {
                margin-top: 20px;
            }
            .btn-primary {
                background-color: #0076BE;
                border-color: #0076BE;
            }
            .btn-primary:hover {
                background-color:#084298;
                border-color: #084298;
            }

            .modal-content {
                background-color: #fefefe;
                width: auto; /* Fixed width */
                height: auto;
                margin: 100px auto; /* Center the modal vertically and horizontally */
                padding: 25px ;
                border: 1px solid #888;
                border-radius: 15px;
            }

            .modal-dialog {
                margin-top: 50px;
            }


        </style>

    </head>

    <body>
        <jsp:include page="/menu.jsp" />


        <div class="container">
            <!--            ////////////HEADER////////////-->

            <h1 class="text-center">Expense Tracking</h1><br>
            <div class="row">
                <div class="col-md-6">
                    <h2 id="totalBalance" style="color: green">Total Balance: $XXX</h2>
                </div>
                <div class="col-md-6">
                    <h2 id="totalExpenses" style="color: #ff6666">Total Expenses: $XXX</h2>
                </div>
            </div><br>
            <!--            ////////////SORT////////////-->
            <form id="sortForm" action="MainController?action=sort" method="POST">
                <div class="row mb-3">

                    <div class="col-md-3">
                        <select class="form-control" id="sortByCategory" name="category">
                            <option value="0">Sort by Category</option>
                            <c:forEach var="category" items="${sessionScope.category}">
                                <option value="${category.getCategoryID()}">${category.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-control" id="sortByAccount" name="account">
                            <option value="0">Sort by Account</option>
                            <c:forEach var="AccountDTO" items="${requestScope.accountList}">
                                <option value="${AccountDTO.getAccountID()}"> ${AccountDTO.getAccountName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-control" id="sortByType" name="type">
                            <option value="">Sort by Expense/Income</option>
                            <option value="expense">Expense</option>
                            <option value="income">Income</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select class="form-control" id="sortByDate" name="date">
                            <option value="desc">Sort by Date</option>
                            <option value="asc">Ascending</option>
                            <option value="desc">Descending</option>
                        </select>
                    </div>

                    <div class="col-md-1">
                        <button type="submit" style="background-color: #0076BE" class="btn btn-primary" value="sort">Sort</button>
                    </div>                 
                </div>
            </form>                      <!--            /////////////////////////////ADD NEW///////////////////////////////-->

            <button type="button" class="btn btn-primary" style="background-color: #0076BE" data-toggle="modal" data-target="#addTransactionModal">
                Add new transaction
            </button>

            <div class="modal fade" id="addTransactionModal" tabindex="-1" role="dialog" aria-labelledby="addTransactionModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addTransactionModalLabel">Add New Transaction</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form id="transactionForm" action="MainController?action=addtransaction" method="POST">

                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter transaction name" required>
                                </div>

                                <div class="form-group">
                                    <label for="amount">Amount</label>
                                    <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter amount" min="1" required>
                                </div>

                                <div class="form-group">
                                    <label for="date">Date</label>
                                    <input type="date" class="form-control" id="date" name="date" required>
                                </div>

                                <div class="form-group">
                                    <label for="type">Type</label>
                                    <select class="form-control" id="type" name="type" required>
                                        <option value="expense">Expense</option>
                                        <option value="income">Income</option>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label for="category">Category</label>
                                    <select class="form-control" id="category" name="category" required>
                                        <c:forEach var="category" items="${sessionScope.category}">
                                            <option value="${category.getCategoryID()}">${category.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="account">Account</label>
                                    <select class="form-control" id="account" name="account" required>
                                        <c:forEach var="account" items="${requestScope.accountList}">
                                            <option value="${account.getAccountID()}">${account.getAccountName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="note">Note</label>
                                    <input type="text" class="form-control" id="note" name="note" placeholder="Enter note">
                                </div>                                
                                <button type="submit" class="btn btn-primary" value="addtransaction">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--            /////////////////////////////EDIT///////////////////////////////-->

            <div class="modal fade" id="editTransactionModal" tabindex="-1" role="dialog" aria-labelledby="editTransactionModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editTransactionModalLabel">Edit Transaction</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form id="editTransactionForm" action="MainController?action=edittransaction" method="POST">

                                <!-- Hidden field to store the transaction ID -->
                                <input type="hidden" id="editTransactionId" name="id">
                               <input type="hidden" id="extype" name="extype">
                               <input type="hidden" id="examount" name="examount">
                               <input type="hidden" id="exaccount" name="exaccount">
                               
                                <div class="form-group">
                                    <label for="editName">Name</label>
                                    <input type="text" class="form-control" id="editName" name="name" placeholder="Enter transaction name" required>
                                </div>

                                <div class="form-group">
                                    <label for="editAmount">Amount</label>
                                    <input type="number" class="form-control" id="editAmount" name="amount" placeholder="Enter amount" min="1" required>
                                </div>

                                <div class="form-group">
                                    <label for="editDate">Date</label>
                                    <input type="date" class="form-control" id="editDate" name="date" required>
                                </div>

                                <div class="form-group">
                                    <label for="editType">Type</label>
                                    <select class="form-control" id="editType" name="type" required>
                                        <option value="expense">Expense</option>
                                        <option value="income">Income</option>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label for="editCategory">Category</label>
                                    <select class="form-control" id="editCategory" name="category" required>
                                        <c:forEach var="category" items="${sessionScope.category}">
                                            <option value="${category.getCategoryID()}">${category.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="editAccount">Account</label>
                                    <select class="form-control" id="editAccount" name="account" required>
                                        <c:forEach var="AccountDTO" items="${requestScope.accountList}">
                                            <option value="${AccountDTO.getAccountID()}"> ${AccountDTO.getAccountName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="editNote">Note</label>
                                    <input type="text" class="form-control" id="editNote" name="note" placeholder="Enter note">
                                </div>                                
                                <button type="submit" class="btn btn-primary" value="edittransaction">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!--            /////////////////////////////TRANS LIST///////////////////////////////-->
            <table id="transactionTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Category</th>                 
                        <th>Name</th>
                        <th>Amount</th>
                        <th>Account</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <!--            ////////////TABLE BODY////////////-->
                <tbody id="transactionTableBody">
                    <c:forEach var="transaction" items="${requestScope.transactionList}">
                        <tr>
                            <!--                        /////Date/////////-->
                            <td>${transaction.getDate()}</td>

                            <!--                            //Expense/Income-->
                            <td style="color: ${transaction.getTransactionType().equals("expense") ? "red" : "green"}">
                                ${transaction.getTransactionType()}
                            </td>                            

                            <!--                        /////Category/////////-->
                            <td> 
                                <c:if test="${not empty sessionScope.category}">
                                    <c:forEach var="ExpenseCategoryDTO" items="${sessionScope.category}">
                                        <c:if test="${transaction.getCategoryID() == ExpenseCategoryDTO.getCategoryID() }">
                                            ${ExpenseCategoryDTO.getName()}
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </td>

                            <!--                        /////Name/////////-->
                            <td>${transaction.getName()}</td>

                            <!--                        /////Amount/////////-->
                            <td>${transaction.getAmount()}</td>

                            <!--                        /////Account/////////-->                            
                            <td> 
                                <c:if test="${not empty requestScope.accountList}">
                                    <c:forEach var="AccountDTO" items="${requestScope.accountList}">
                                        <c:if test="${transaction.getAccountID() == AccountDTO.getAccountID() }">
                                            ${AccountDTO.getAccountName()}
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </td>
                            <!--                        /////EDIT/////////-->       

                            <td><button class="btn btn-info editBtn" style="background-color: #0076BE"
                                        data-toggle="modal" 
                                        data-target="#editTransactionModal"
                                        data-transaction-id="${transaction.getTransactionID()}"
                                        data-transaction-name="${transaction.getName()}"
                                        data-transaction-amount="${transaction.getAmount()}"
                                        data-transaction-date="${transaction.getDate()}"
                                        data-transaction-type="${transaction.getTransactionType()}"
                                        data-transaction-category="${transaction.getCategoryID()}"
                                        data-transaction-account="${transaction.getAccountID()}"
                                        data-transaction-note="${transaction.getNote()}">Edit</button></td>


                            <!--                        /////Delete/////////-->                                                        
                            <td>
                                <form action="MainController?action=deletetransaction" method="post">
                                    <input type="hidden" name="transid" value="${transaction.getTransactionID()}">
                                    <input type="hidden" name="transtype" value="${transaction.getTransactionType()}">
                                    <input type="hidden" name="userid" value="${transaction.getUserID()}">
                                    <input type="hidden" name="accountid" value="${transaction.getAccountID()}">
                                    <button class="btn btn-info" style="background-color: #0076BE" type="submit" value="deletetransaction">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br><br><br><br><br>  <br>

        <jsp:include page="/footer.jsp" />

        <!-- Bootstrap JS -->
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
            var transactionList = [
        <c:forEach var="transaction" items="${requestScope.transactionList}" varStatus="status">
            {
            amount: ${transaction.amount},
                    transactionType: '${transaction.transactionType}'
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
            ];

// Function to calculate total balance and total expenses
            function calculateTotals(transactionList) {
                let totalBalance = 0;
                let totalExpenses = 0;

                for (let i = 0; i < transactionList.length; i++) {
                    if (transactionList[i].transactionType === "income") {
                        totalBalance += transactionList[i].amount;
                    } else if (transactionList[i].transactionType === "expense") {
                        totalBalance -= transactionList[i].amount;
                        totalExpenses += transactionList[i].amount;
                    }
                }

                return {totalBalance: totalBalance, totalExpenses: totalExpenses};
            }

// Calculate totals
            let totals = calculateTotals(transactionList);

// Update HTML elements with the calculated totals
            document.getElementById("totalBalance").textContent = "Total Balance: $" + totals.totalBalance.toFixed(2);
            document.getElementById("totalExpenses").textContent = "Total Expenses: $" + totals.totalExpenses.toFixed(2);

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            // Function to populate the edit modal form with existing data
            function populateEditForm(transaction) {
                document.getElementById('editTransactionId').value = transaction.id;
                document.getElementById('editName').value = transaction.name;
               document.getElementById('extype').value = transaction.type;
               document.getElementById('exaccount').value = transaction.account;
               document.getElementById('examount').value = transaction.amount;
               document.getElementById('editName').value = transaction.name;
                document.getElementById('editAmount').value = transaction.amount;
                document.getElementById('editDate').value = transaction.date;
                document.getElementById('editType').value = transaction.type;
                setSelectedOption(document.getElementById('editCategory'), transaction.category);
                setSelectedOption(document.getElementById('editAccount'), transaction.account);

                document.getElementById('editNote').value = transaction.note;
            }
            function setSelectedOption(selectElement, value) {
                for (let i = 0; i < selectElement.options.length; i++) {
                    if (selectElement.options[i].value === value) {
                        selectElement.selectedIndex = i;
                        break;
                    }
                }
            }
            // Attach event listeners to each edit button
            var editButtons = document.querySelectorAll('.editBtn');
            editButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    // Get the transaction data associated with the clicked button
                    var transaction = {
                        id: button.dataset.transactionId,
                        name: button.dataset.transactionName,
                        amount: button.dataset.transactionAmount,
                        date: button.dataset.transactionDate,
                        type: button.dataset.transactionType,
                        category: button.dataset.transactionCategory,
                        account: button.dataset.transactionAccount,
                        note: button.dataset.transactionNote
                    };
                    // Populate the edit form with the transaction data
                    populateEditForm(transaction);
                });
            });



    </script>

</html>
