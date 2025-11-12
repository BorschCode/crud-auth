DEPRECATED and NON-ACTUAL
===
## Let it be like my studying work

#####Simple CRUD system based on Codeigniter using Ajax, Bootstrap, Models and MySQL // Simple equipment accounting system based on an authorization system

This accounting system was written to manage a cartridge database.
Key Features:
- user authentication in the system
- user access level management
- main page
- adding, editing, deleting items (CRUD)
- maintaining a change log and log of key events
- Russian management interface / logging in Russian

Code comments are almost absent
The link on the image leads to YouTube for a video presentation
[![presentation](http://forum.norma4.net.ua/photoplog/images/9110/1_main.png)](https://youtu.be/v0Up1ZfV0B0)

> The framework taken as a basis is [Codeigniter version 4](https://codeigniter.com/).
> [Bootstrap 4](http://getbootstrap.com/) was also used as an acceptable visual component, [FontAwesome](http://fontawesome.io/) fonts were used, and [DataTables](https://datatables.net/) was used for convenient sorting.

Installation
------------

The easiest way will be to download the archive and extract it.
In the root folder, you will also find database files with tables.
Installation differs little from a standard CodeIgniter installation.

Installation Instructions:

CodeIgniter installation takes four steps:

    Extract the archive.
    Upload the CodeIgniter files and folders to your server. Typically, the index.php file is located in the root folder of the site.
    Open the application/config/config.php file in a text editor and set the base URL. If you are going to use encryption or sessions, set an encryption key.
    If you intend to use a database, open the application/config/database.php file in a text editor and set your database settings.

At the end of all performed operations, you will need to configure the base address and enter data for accessing the DB.
The database files are located in the root of the folder.

### File list with a description of their functions

The project essentially consists of controller files, one for each function: one controller is responsible for working with cartridges, the second - for authorization, the third - manages user data, and the fourth - is a unique start page.
Each controller has its own viewer (view file).
The project also includes the `assets` folder, which contains Bootstrap, datatables, jquery, and FontAwesome.otf.

File Name             | File Content
----------------------|----------------------
phpstorm.php          | Contains syntax for ease of working with Codeigniter
assets                | Folder containing local Bootstrap, datatables, jquery.
Cartridge.php         | Main cartridge management controller
Login.php             | Main authorization management controller
main.php              | Main landing page management controller
user_controller.php   | Main user management controller
cartridge_model.php   | Main model file, key function - working with the cartridge database
login_model.php       | Main model file, key function - user verification.
users_model.php       | Main model file, key function - user editing.
add_cartridge.php     | View file for entering data about a new item
cartridge_details.php | View file that builds the main table displaying all items
edit_details.php      | View file for editing item data
story_of_element.php  | View file for the history page
auth_managment        | View file for the authorization page to manage users
footer.php            | View file for the site footer
header.php            | View file for the site header
instruction.php       | View file for the instructions page
login_form.php        | View file for the login page
main_view.php         | View file for the main page
registration_for.php  | View file for the registration page
users_manage.php      | View file for the user management page
cartridgedb.sql       | Prepared database file for items with comments for each field
story.sql             | Prepared database file for history with comments for each field
user_login.sql        | Prepared database file for users with comments for each field
----------------------|-----------------------

Requirements
------------

Standard requirements for CodeIgniter:

        MySQL (5.1+) via the mysql (deprecated), mysqli, and pdo drivers
        Oracle via the oci8 and pdo drivers
        PostgreSQL via the postgre and pdo drivers
        MS SQL via the mssql, sqlsrv (versions 2005 and higher only), and pdo drivers
        SQLite via the sqlite (version 2), sqlite3 (version 3), and pdo drivers
        CUBRID via the cubrid and pdo drivers
        Interbase/Firebird via the ibase and pdo drivers
        ODBC via the odbc and pdo drivers (you should know that ODBC is relevant at an abstract level)


Main Page Description
------------
![screenshot of sample](http://forum.norma4.net.ua/photoplog/images/9110/1_main.png)

The main page consists of three view files that are loaded sequentially in the `main` controller.
`header.php` + `main_view.php` + `footer.php` create the starting page, and accordingly `header.php` + `footer.php` are used to create the site's footer and header. From the start page, you can immediately access the user management page.
User editing options are available here:

![screenshot of sample](http://forum.norma4.net.ua/photoplog/images/9110/1_users_man.png)

User editing occurs by calling an additional menu via Ajax:

![screenshot of sample](http://forum.norma4.net.ua/photoplog/images/9110/1_new_manage_window.png)

Item Management Page Description
------------
Here are the values displayed in the table/list.
All information is loaded from the DB.
If there are no items in the DB or if unauthorized access is attempted, the message ***No records in the database*** will be displayed.
With access level 1, only history and adding cartridges will be available.
![screenshot of sample](http://forum.norma4.net.ua/photoplog/images/9110/1_control.png)

Access level 2 is required for editing items.
![screenshot of sample](http://forum.norma4.net.ua/photoplog/images/9110/1_control2.png)

        Column Name     | Column Content
        ----------------|-----------------------------------------------------------------------------------------------------------------------------------------------
        id              | unique item number - taken from the DB.
        Owner Department| where the cartridge is installed or to whom it belongs according to the inventory database
        Brand           | cartridge manufacturer
        Model           | cartridge model assigned by the manufacturer
        Code            | unique cartridge code / inventory number
        Refilled By     | service center that performed the repair/refill/restoration
        Status          | technical condition of the cartridge (in operation or decommissioned)
        Note            | comments explaining a particular situation with the cartridge
        Weight Before   | weight before sending to the service center
        Weight After    | weight after refill
        Weight Difference| weight difference is calculated automatically when accessing the item, information about this value is not stored in the DB
        Departure Date  | when it was sent to the service center
        Arrival Date    | when it was received from the service center
        Change          | button to edit information about the item
        Delete          | button to delete the item from the database
        History         | button redirects to the change log page for the item
        IS              | In Service (1) or not (0) is calculated automatically: when the Arrival Date field is less than the Departure Date field, the value 1 (In Service) is assigned.
        -----------------------------------------------------------------------------------------------------------------------------------------------------------------

Description of the Item History Page
------------

Here are the values displayed in the table/list on the item history page.
All information is loaded from the DB.

![screenshot of sample](http://forum.norma4.net.ua/photoplog/images/9110/3_Screenshot-2017-10-23___________________.png)

     Column Name             | Column Content
     ------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------
     id                      | unique record number - taken from the DB.
     Owner Department        | where the cartridge is installed or to whom it belongs according to the inventory database
     Refilled By             | service center that performed the repair/refill/restoration
     Status                  | technical condition of the cartridge (in operation or decommissioned)
     Weight Before           | weight before sending to the service center
     Weight After            | weight after refill
     Departure Date          | when it was sent to the service center
     Arrival Date            | when it was received from the service center
     Date of Change Entry    | Date the change was entered into the item history or the first access to the history page
     ------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------
     ***Note//Comments***
     Field loaded from the cartridge/cartridgedb DB
     ***Text log showing changes that occurred in the item's values***
     Field loaded from the cartridge/story DB, selected by the highest `id` index in the DB to display the latest changes
     - contains a brief history of key changes: specifically, it only lists keys and the information that changed in those keys
     ***Full text change log displays information about values. Was ---- Became***
     Text field loaded from the cartridge/story DB, selected by the highest `id` index in the DB to display the latest changes.
     Upon each edit and data change, it records all data before editing and the data that resulted after editing.

Other Versions and Future Changes
-----------

The next version already implements a user registration and authorization system.
This version is not secure in terms of input data validation; subsequent versions do not suffer from this.

Leave wishes and corrections in the code commenting thread.

For contact - I am on [LinkedIn](https://www.linkedin.com/in/сергей-обухов-703426140/).