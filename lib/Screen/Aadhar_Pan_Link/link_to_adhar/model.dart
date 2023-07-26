class Discrip {
  final text;

  Discrip(this.text);
}

final List<Discrip> textlList =
    List.generate(text.length, (index) => Discrip(text[index]));

List text = [
  """Link By SMS 

 Step 1: Type a message in the format UIDPAN.
 Step 2: Send the message to 56161 or 567678 from your registered mobile number.
 Step 3: You will get a confirmation message about linking your aadhar with PAN.""",
  """
Link Aadhar With PAN 

 You can link your PAN with Aadhaar by following process:

a) Open the Income Tax e-filing portal - https://incometaxindiaefiling.gov.in/

b) Register on it (if not already done). Your PAN (Permanent Account Number) will be your user id.

c) Log in by entering the User ID, password and date of birth.

d) A pop up window will appear, prompting you to link your PAN with Aadhaar. If not, go to ‘Profile Settings’ on Menu bar and click on ‘Link Aadhaar’.

e) Details such as name date of birth and gender will already be mentioned as per the PAN details.

f) Verify the PAN details on screen with the ones mentioned on your Aadhaar. Pls. note that if there is a mismatch, you need to get the same corrected in either of the documents.

g) If the details match, enter your Aadhaar number and click on the “link now” button.

h) A pop-up message will inform you that your Aadhaar has been successfully linked to your PAN

i) You may also visit https://www.utiitsl.com/ OR https://www.egov-nsdl.co.in/ to link your PAN and Aadhaar.""",
  """Check Link Status Check your Aadhaar and Bank Account Linking Status in NPCI mapper.
""",
];
