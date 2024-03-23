USE [master]
GO
/****** Object:  Database [asm]    Script Date: 3/12/2024 2:36:41 AM ******/
CREATE DATABASE [asm] ON  PRIMARY 

USE [asm]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](255) NOT NULL,
	[WalletType] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Balance] [decimal](10, 2) NOT NULL,
	[Note] [nvarchar](100) NULL,
	[BankID] [int] NULL,
	[EWalletID] [int] NULL,
	[IsActive] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankID] [int] NOT NULL,
	[BankName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EWallet]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EWallet](
	[EWalletID] [int] NOT NULL,
	[EWalletName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EWalletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseCategory]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseCategory](
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Date] [date] NOT NULL,
	[TransactionType] [nvarchar](7) NOT NULL,
	[AccountID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[Note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transfer]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfer](
	[TransferID] [int] IDENTITY(1,1) NOT NULL,
	[FromAccountID] [int] NULL,
	[ToAccountID] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[UserID] [int] NOT NULL,
	[Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NOT NULL,
	[CurrentBalance] [decimal](10, 2) NOT NULL,
	[ExpenseAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[WalletTypeID] [int] NOT NULL,
	[TypeName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WalletTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Bank] FOREIGN KEY([BankID])
REFERENCES [dbo].[Bank] ([BankID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Bank]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_EWallet] FOREIGN KEY([EWalletID])
REFERENCES [dbo].[EWallet] ([EWalletID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_EWallet]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_User]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Wallet] FOREIGN KEY([WalletType])
REFERENCES [dbo].[Wallet] ([WalletTypeID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Wallet]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_ExpenseCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ExpenseCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_ExpenseCategory]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_FromAccount] FOREIGN KEY([FromAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_FromAccount]
GO
ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_ToAccount] FOREIGN KEY([ToAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_ToAccount]
GO
ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_User]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [CHK_TransactionType] CHECK  (([TransactionType]='expense' OR [TransactionType]='income'))
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [CHK_TransactionType]
GO
/****** Object:  Trigger [dbo].[UpdateBalances]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[UpdateBalances]
ON [dbo].[Transaction]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update Account balance
    UPDATE a
    SET a.Balance = a.Balance + CASE i.TransactionType WHEN 'income' THEN i.Amount ELSE -i.Amount END
    FROM dbo.[Account] a
    JOIN inserted i ON a.AccountID = i.AccountID;

    -- Update User balance
    UPDATE u
    SET u.CurrentBalance = u.CurrentBalance + CASE i.TransactionType WHEN 'income' THEN i.Amount ELSE -i.Amount END
    FROM dbo.[User] u
    JOIN inserted i ON u.UserID = i.UserID;
END;

GO
ALTER TABLE [dbo].[Transaction] ENABLE TRIGGER [UpdateBalances]
GO
/****** Object:  Trigger [dbo].[UpdateUserExpenseAmount]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateUserExpenseAmount]
ON [dbo].[Transaction]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update User's Expense Amount
    UPDATE u
    SET u.ExpenseAmount = u.ExpenseAmount + (SELECT SUM(i.Amount) FROM inserted i WHERE i.UserID = u.UserID AND i.TransactionType = 'expense')
    FROM dbo.[User] u
    JOIN inserted i ON u.UserID = i.UserID
    WHERE i.TransactionType = 'expense';

END;
GO
ALTER TABLE [dbo].[Transaction] ENABLE TRIGGER [UpdateUserExpenseAmount]
GO
/****** Object:  Trigger [dbo].[UpdateAccountBalanceOnTransfer]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Update account after transfer 
create TRIGGER [dbo].[UpdateAccountBalanceOnTransfer]
ON [dbo].[Transfer]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update balances for all rows in the inserted set
    UPDATE A
    SET A.Balance = A.Balance - I.Amount -- Deduct amount from source account
    FROM dbo.[Account] A
    INNER JOIN dbo.[Transfer] T ON A.AccountID = T.FromAccountID
    INNER JOIN inserted I ON T.TransferID = I.TransferID;

    UPDATE B
    SET B.Balance = B.Balance + I.Amount -- Add amount to destination account
    FROM dbo.[Account] B
    INNER JOIN dbo.[Transfer] T ON B.AccountID = T.ToAccountID
    INNER JOIN inserted I ON T.TransferID = I.TransferID;
END;
GO
ALTER TABLE [dbo].[Transfer] ENABLE TRIGGER [UpdateAccountBalanceOnTransfer]
GO
/****** Object:  Trigger [dbo].[CreateCashAccountForNewUser]    Script Date: 3/12/2024 2:36:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[CreateCashAccountForNewUser]
ON [dbo].[User]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert a new cash account for the newly inserted user
    DECLARE @UserID INT;
    SELECT @UserID = UserID FROM inserted;

    INSERT INTO dbo.[Account] (AccountName, WalletType, UserID, Balance, IsActive)
    VALUES ('Cash', 1, @UserID, 0, 1); -- Assuming WalletType 1 represents Cash
END;
GO
ALTER TABLE [dbo].[User] ENABLE TRIGGER [CreateCashAccountForNewUser]
GO
USE [asm]
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1, N'Vietcombank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (2, N'Agribank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (3, N'BIDV')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (4, N'Citibank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (5, N'Techcombank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (6, N'VietinBank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (7, N'VPBank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (8, N'MB Bank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (9, N'SHB')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (10, N'ACB')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (11, N'Sacombank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (12, N'HDBank')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (13, N'VIB')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (14, N'Standard Chartered')
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (15, N'Shinhan Bank')
GO
INSERT [dbo].[EWallet] ([EWalletID], [EWalletName]) VALUES (1, N'Momo')
GO
INSERT [dbo].[EWallet] ([EWalletID], [EWalletName]) VALUES (2, N'ZaloPay')
GO
INSERT [dbo].[EWallet] ([EWalletID], [EWalletName]) VALUES (3, N'Viettel Money')
GO
INSERT [dbo].[EWallet] ([EWalletID], [EWalletName]) VALUES (4, N'Payoo')
GO
INSERT [dbo].[EWallet] ([EWalletID], [EWalletName]) VALUES (5, N'Shopee Pay')
GO
INSERT [dbo].[EWallet] ([EWalletID], [EWalletName]) VALUES (6, N'VNPay')


GO
INSERT [dbo].[Wallet] ([WalletTypeID], [TypeName]) VALUES (1, N'Cash')
GO
INSERT [dbo].[Wallet] ([WalletTypeID], [TypeName]) VALUES (2, N'Bank')
GO
INSERT [dbo].[Wallet] ([WalletTypeID], [TypeName]) VALUES (3, N'EWallet')
GO
INSERT [dbo].[Wallet] ([WalletTypeID], [TypeName]) VALUES (4, N'Other')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[User] ([Username], [Email], [Password], [CurrentBalance], [ExpenseAmount]) VALUES ( N'John Smith', N'john@example.com', N'password123', CAST(0.00 AS Decimal(10, 2)),  CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[User] ([Username], [Email], [Password], [CurrentBalance], [ExpenseAmount]) VALUES (N'Emma Johnson', N'emma@example.com', N'password456', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[User] ([Username], [Email], [Password], [CurrentBalance], [ExpenseAmount]) VALUES (N'Michael Nguyen', N'michael@example.com', N'password789',CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[User] ( [Username], [Email], [Password], [CurrentBalance], [ExpenseAmount]) VALUES (N'Sophia Tran', N'sophia@example.com', N'passwordabc',CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[User] ([Username], [Email], [Password], [CurrentBalance], [ExpenseAmount]) VALUES ( N'William Le', N'william@example.com', N'passworddef',CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[User] ([Username], [Email], [Password], [CurrentBalance], [ExpenseAmount]) VALUES ( N'Vo Ngoc Bao Thu', N'thuvnbse183213@fpt.edu.vn', N'12345',CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))

GO
INSERT [dbo].[Account] ( [AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Alyda Grigoli', 1, 1, CAST(0.00 AS Decimal(10, 2)), N'Nulla tellus.', NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Arlyn Camosso', 2, 2, CAST(0.00 AS Decimal(10, 2)), NULL, 2, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Freemon Eldrid', 3, 3, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, 5, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES ( N'Penny Whichelow', 4, 4, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Margot Shatliffe', 1, 5, CAST(0.00 AS Decimal(10, 2)), N'In blandit ultrices enim.', NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Boyce Clemenzi', 2, 1, CAST(0.00 AS Decimal(10, 2)), NULL, 6, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Clem Wild', 2, 3, CAST(0.00 AS Decimal(10, 2)), NULL, 7, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Bartholomew Sheere', 1, 2, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Brandise Van der Daal', 4, 2, CAST(0.00 AS Decimal(10, 2)), N'Praesent blandit lacinia era.', NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Davita Rountree', 3, 6, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, 6, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Ryann Kernoghan', 1, 2, CAST(0.00 AS Decimal(10, 2)), N'Quisque porta volutpat erat.', NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Ardra Seedull', 2, 4, CAST(0.00 AS Decimal(10, 2)), NULL, 12, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Dame Tregidgo', 3, 3, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, 2, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Norry Kretchmer', 4, 5, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Aura Mingasson', 1, 6, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Anabal Philipson', 2, 2, CAST(0.00 AS Decimal(10, 2)), NULL, 7, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Glenna Titta', 1, 1, CAST(0.00 AS Decimal(10, 2)), N'Praesent lectus. ', NULL, NULL, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Brandy Baudts', 3, 1, CAST(0.00 AS Decimal(10, 2)), N'In congue. Etiam justo.', NULL, 3, 1)
GO
INSERT [dbo].[Account] ([AccountName], [WalletType], [UserID], [Balance], [Note], [BankID], [EWalletID], [IsActive]) VALUES (N'Cordula Itscowics', 1, 1, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, 1)
GO

SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (1, N'Food')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (2, N'Transportation')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (3, N'Shopping')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (4, N'Rent/Mortgage')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (5, N'Entertainment')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (6, N'Education')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (7, N'Healthcare/Medical')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (8, N'Income')
GO
INSERT [dbo].[ExpenseCategory] ([CategoryID], [Name]) VALUES (9, N'Other')
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (1, 1, N'Groceries', CAST(50.00 AS Decimal(10, 2)), CAST(N'2024-07-01' AS Date), N'expense', 1, 1, N'Weekly grocery shopping')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (2, 1, N'Salary', CAST(2000.00 AS Decimal(10, 2)), CAST(N'2024-09-05' AS Date), N'income', 7, 4, N'Monthly salary')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (3, 1, N'Dinner', CAST(30.00 AS Decimal(10, 2)), CAST(N'2024-02-10' AS Date), N'expense', 12, 1, N'Dinner with friends')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (4, 1, N'Transportation', CAST(20.00 AS Decimal(10, 2)), CAST(N'2022-01-02' AS Date), N'expense', 1, 2, N'Taxi fare')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (5, 1, N'Shopping', CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-02-07' AS Date), N'expense', 12, 6, N'Clothing purchase')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (6, 2, N'Utilities', CAST(70.00 AS Decimal(10, 2)), CAST(N'2021-02-03' AS Date), N'expense', 2, 3, N'Electricity bill')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (7, 2, N'Salary', CAST(2500.00 AS Decimal(10, 2)), CAST(N'2020-02-15' AS Date), N'income', 8, 4, N'Monthly salary')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (8, 2, N'Dining Out', CAST(40.00 AS Decimal(10, 2)), CAST(N'2024-02-20' AS Date), N'expense', 14, 1, N'Lunch with colleagues')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (9, 2, N'Entertainment', CAST(50.00 AS Decimal(10, 2)), CAST(N'2024-02-04' AS Date), N'expense', 15, 5, N'Movie tickets')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (10, 2, N'Shopping', CAST(80.00 AS Decimal(10, 2)), CAST(N'2021-02-10' AS Date), N'expense', 17, 6, N'Grocery shopping')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (11, 2, N'Healthcare', CAST(100.00 AS Decimal(10, 2)), CAST(N'2017-02-15' AS Date), N'expense', 8, 7, N'Doctor consultation')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (12, 3, N'Rent', CAST(500.00 AS Decimal(10, 2)), CAST(N'2019-02-05' AS Date), N'expense', 3, 4, N'Monthly rent payment')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (13, 3, N'Salary', CAST(3000.00 AS Decimal(10, 2)), CAST(N'2024-02-20' AS Date), N'income', 9, 4, N'Monthly salary')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (14, 3, N'Utilities', CAST(60.00 AS Decimal(10, 2)), CAST(N'2024-02-03' AS Date), N'expense', 13, 9, N'Water bill')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (15, 3, N'Transportation', CAST(25.00 AS Decimal(10, 2)), CAST(N'2020-02-10' AS Date), N'expense', 13, 9, N'Bus fare')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (16, 3, N'Groceries', CAST(70.00 AS Decimal(10, 2)), CAST(N'2024-02-15' AS Date), N'expense', 19, 5, N'Weekly grocery shopping')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (17, 3, N'Dining Out', CAST(45.00 AS Decimal(10, 2)), CAST(N'2024-02-05' AS Date), N'expense', 3, 1, N'Dinner with family')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (18, 6, N'Shopping', CAST(120.00 AS Decimal(10, 2)), CAST(N'2024-02-12' AS Date), N'expense', 16, 6, N'Clothing purchase')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (19, 4, N'Utilities', CAST(80.00 AS Decimal(10, 2)), CAST(N'2023-02-07' AS Date), N'expense', 4, 9, N'Electricity bill')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (20, 6, N'Salary', CAST(2800.00 AS Decimal(10, 2)), CAST(N'2023-02-20' AS Date), N'income', 6, 8, N'Monthly salary')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (21, 4, N'Transportation', CAST(30.00 AS Decimal(10, 2)), CAST(N'2023-02-08' AS Date), N'expense', 18, 2, N'Taxi fare')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (22, 4, N'Entertainment', CAST(60.00 AS Decimal(10, 2)), CAST(N'2022-02-18' AS Date), N'expense', 4, 5, N'Concert tickets')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (23, 5, N'Rent', CAST(600.00 AS Decimal(10, 2)), CAST(N'2024-02-10' AS Date), N'expense', 5, 6, N'Monthly rent payment')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (24, 5, N'Salary', CAST(3200.00 AS Decimal(10, 2)), CAST(N'2024-02-25' AS Date), N'income', 11, 8, N'Monthly salary')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (25, 5, N'Utilities', CAST(90.00 AS Decimal(10, 2)), CAST(N'2024-02-12' AS Date), N'expense', 5, 9, N'Electricity bill')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (26, 5, N'Dining Out', CAST(50.00 AS Decimal(10, 2)), CAST(N'2024-02-22' AS Date), N'expense', 11, 4, N'Dinner with friends')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (27, 5, N'Transportation', CAST(35.00 AS Decimal(10, 2)), CAST(N'2021-02-14' AS Date), N'expense', 11, 2, N'Bus fare')
GO
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [Name], [Amount], [Date], [TransactionType], [AccountID], [CategoryID], [Note]) VALUES (28, 6, N'Shopping', CAST(85.00 AS Decimal(10, 2)), CAST(N'2021-02-28' AS Date), N'expense', 16, 2, N'Grocery shopping')
GO

SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO

USE [master]
GO
ALTER DATABASE [asm] SET  READ_WRITE 
GO
