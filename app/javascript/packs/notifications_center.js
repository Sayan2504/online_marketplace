$(document).ready(function()
{
    // open notification center on click
    
    $('body').on('click','#open_notification', function()
    {
        console.log("open");
        $("#notificationContainer").fadeToggle(300);
        $("#notification_count").fadeOut("fast");
        return false;
    });
 
    // hide notification center on click
    $(document).click(function()
    {
        console.log("outside click");
        $("#notificationContainer").hide();
    });
 
 
    
    $('body').on('click','#notificationContainer', function()
    {
        console.log("close");
        return false;
    });
    console.log("ready");
});