$( document ).on("turbolinks:load", function()
{
    $("body").on("click","#open_notification", function()
    {
        $("#notificationContainer").fadeToggle(300);
        $("#notification_count").fadeOut("fast");
        return false;
    } );
 
    $(document).click(function()
    {
        $("#notificationContainer").hide();
    } );
     
    $("body").on("click","#notificationContainer", function()
    {
        return false;
    } );
} );