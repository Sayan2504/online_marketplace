$( document ).on("turbolinks:load", function()
{
    // open notification center on click
    
    $("body").on("click","#open_notification", function()
    {
        $("#notificationContainer").fadeToggle(300);
        $("#notification_count").fadeOut("fast");
        return false;
    });
 
    // hide notification center on click
    $(document).click(function()
    {
        $("#notificationContainer").hide();
    });
 
 
    
    $("body").on("click","#notificationContainer", function()
    {
        return false;
    });
});