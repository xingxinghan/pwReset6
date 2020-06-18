var cardread;

var webchannel = new QWebChannel(qt.webChannelTransport, function(channel) {
	cardread = channel.objects.cardread;
	cardread.sendToJsp.connect(function(stuNo) {  
		if(stuNo) {
			$('#uid').val(stuNo);
	        $('#cust_add_modal').modal('show');
 	   	}
    });  
});

setInterval(function() {
	cardread.receiveFlagFromJsp(1);
}, 2000);

