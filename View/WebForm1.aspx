<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StayEsay.View.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title></title>
    <script src="../Asset/vendor/js/jquery-3.2.1.min.js"></script>
  
 <script>
     $(document).ready(function () {
         $("#File1").change(function () {

             var previewimages = $("#showimage");
             previewimages.html("");
             $($(this)[0].files).each(function () {
                 var file = $(this);
                 var reader = new FileReader();
                 reader.onload = function (e) {
                     var img = $("<img />");
                     img.attr("style", "height:150px;width: 150px;");
                     img.attr("src", e.target.result);
                     previewimages.append(img);
                 }
                 reader.readAsDataURL(file[0]);
             });

         });
     });
    </script>
</head>
<body>
    <div>
        <h1>Hariti Study Hub</h1>
        <h4>How to Preview and Upload Multiple Images in Asp.Net with Jquery</h4>
        <hr />
    </div>
    <form method="post" enctype="multipart/form-data" runat="server">                
    Upload Images
    <input type="file" multiple="multiple" name="File1" id="File1" accept="image/*" />
    <br /><br />
    <div id="showimage">
    </div>
    <hr />  
    <asp:Button ID="Button1" runat="server" Text="Upload and Save" OnClick="Button1_Click" />
</form>
    

    <asp:Label ID="Label" runat="server" Text=""></asp:Label>
    </body>
</html>
