<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/patientDetailsForm.css">
    <title>Patient Details Form</title>
</head>
<body>
    <form action="">
        <h1 id="title">Patient's Details</h1>

        <table id="table-inside-form">
            <tr>
                <td colspan="2" class="cells-for-small-labels">
                    <h2>General Information</h2>
                </td>
            </tr>

            <!-- FULL NAME -->
            <tr>
                <td class="cells-for-small-labels">
                    <label for="full-name" class="input">Full name: </label>
                </td>

                <td><input type="text" name="full-name" class="small-input-box" required placeholder="LastName, FirstName MiddleName">
                    <br>
                </td>
            </tr>

            <!-- BIRTHDAY -->
            <tr>
                <td class="cells-for-small-labels">
                    <label for="bday" class="input">Date of Birth</label>
                </td>

                <td>
                    <input type="date" name="bday" class="small-input-box" >
                </td>
            </tr>

            <!-- GENDER -->
            <tr>
                <td class="cells-for-small-labels">
                    <label for="gender" class="input">Gender:</label>
                </td>

                <td>
                    <input type="radio" class="radio-options" name="gender" id="radio" value="M" required>
                    <label for="gender">Male</label>

                    <input type="radio" class="radio-options" name="gender" id="radio" value="F">
                    <label for="gender">Female</label>

                </td>
            </tr>


            <!-- MEDICAL DETAILS -->
            <tr>
                <td colspan="2">
                    <br>
                    <h2>Medical Details</h2>
                </td>
                
            </tr>

            <!-- Physician -->
            <tr>
                <td class="cells-for-small-labels">
                    <label for="physician" class="input">Physician:</label>
                </td>

                <td>
                    <input type="text" name="physician" class="small-input-box" placeholder="Physician ID" required>
                </td>
            </tr>

            <tr>
                <!-- WARD ASSIGNED -->
                <td class="cells-for-small-labels">
                    <label for="ward-assigned" class="input">Ward Assigned: </label>
                </td>

                <td>
                    <input type="text" name="ward-assigned" class="small-input-box"  required>
                </td>
            </tr>

            <!-- Allergies -->
            <tr>
                <td class="cells-for-small-labels">
                    <label for="allergies" class="input">Allergies: </label>
                </td>

                <td>
                    <input type="text" name="allergies" class="small-input-box" >
                </td>
            </tr>

            <!-- MEDICATIONS -->
            <tr>
                <td class="cells-for-small-labels">
                    <label for="medications" class="input">Medications: </label>
                </td>

                <td>
                    <input type="text" name="medications" class="small-input-box" >
                </td>
            </tr>

            <!-- SIGNS AND SYMPTOMS -->
            <tr>
                <td colspan="2">
                    <br>
                    <label for="signs-and-symptoms" class="input">Signs and Symptoms: </label> <br>
                    <textarea name="sign-and-symptoms" class="big-input-box"></textarea> <br>  
                </td>
            </tr>

            <!-- PAST MEDICAL HISTORY -->
            <tr>
                <td colspan="2">
                    <label for="past-medical-history" class="input">Past Medical History: </label> <br>
                    <textarea name="past-medical-history" class="big-input-box"></textarea> <br>
                </td>
            </tr>

            <!-- EVENTS LEADING UP TO THE CURRENT ILLNESS OR INJURY -->
            <tr>
                <td colspan="2">
                    <label for="events" class="input">Events Leading up to the Current Illness or Injury: </label> <br>
                    <textarea name="events" class="big-input-box"></textarea> <br>
                </td>
            </tr>

            <!-- DISCHARGE DETAILS -->
            <tr>
                <td colspan="2">
                    <label for="discharge-details" class="input">Discharge Details: </label> <br>
                    <textarea name="discharge-details" class="big-input-box"></textarea> <br>
                    <br>
                </td>
            </tr>
        </table>


        <div id="submit-button-container">
            <input type="submit" class="submit-button">
        </div>
        <br>

    </form>
    <br><br>
        
</body>
</html>