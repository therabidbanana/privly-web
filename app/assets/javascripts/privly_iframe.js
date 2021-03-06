// Tracks single and double clicks on a resource.
// A single click will open the resource on the content server.
// A double click will open the resource in place for permissioned operations.
var iframeBehavior = {
    
    clickCount: 0,
    
    singleClick: function(evt)
    {
        iframeBehavior.clickCount = 0;
        
        if(evt.target.nodeName == "A"){
          parent.window.location = evt.target.href;
        }
        else{
          url = window.document.location.toString();
          var url = url.replace(".iframe", ".html").replace("format=iframe", "format=html");
          window.open(url, '_blank');
        }  
    },
    
    doubleClick: function()
    {
        iframeBehavior.clickCount = 0;
        
        jQuery("#post_content").toggle();
        jQuery("#post_form").toggle();
        iframeBehavior.resize();
    },
    
    click: function(evt)
    {
        //if double click
        if(iframeBehavior.clickCount > 1)
        {
            iframeBehavior.doubleClick();
        }
        else if(iframeBehavior.clickCount == 1 && jQuery("#post_content").is(":visible"))
        {
            //single click on rendered content, go to form
            iframeBehavior.singleClick(evt);
        }
    },
    
    dispatchResize: function(height) {
        //This event is fired with the required height of the iframe
        var evt = document.createEvent("Events");  
        evt.initEvent("IframeResizeEvent", true, false);
        var element = document.createElement("privElement");
        element.setAttribute("height", height);  
        var frameId = window.name;
        element.setAttribute("frame_id", frameId);  
        document.documentElement.appendChild(element);    
        element.dispatchEvent(evt);
        // Send the message "id,height" to the parent window
        parent.postMessage(frameId+","+height,"*");
        element.parentNode.removeChild(element);
    },
    
    resize: function() {
        iframeBehavior.dispatchResize(15);
        jQuery("body").attr("height","100%");
        
        var newHeight = document.getElementById("wrapper").offsetHeight;
        // add 18px just to accommodate the tooltip
        newHeight = newHeight + 18;
        iframeBehavior.dispatchResize(newHeight);
    }
};

jQuery(document).ready(function(){
    iframeBehavior.resize();
});
