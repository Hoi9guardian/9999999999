var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);

//var userlist = new Array();
var chatlist = new Map();





app.get('/', function(req, res){
  res.send('<h1>안녕하세요 "/" 경로입니다.');

});


//채팅
io.on('connection', function(socket){
  console.log('한명의 유저가 접속하였습니다.');
  socket.emit('connection',{
    type:'connected'
  });

  socket.on('connection', function(data){
    if(data.type=='join'){
      socket.join(data.cafe_no);

      socket.room = data.cafe_no;






      socket.emit('system',{
        msg : data.title+' 채팅방에 오신 것을 환영합니다.'
      })

      socket.broadcast.to(socket.room).emit('system', {
        msg : data.member_id + '님이 접속하셨습니다.'
      })



      if(chatlist.has(socket.room)){

          var userlist = chatlist.get(socket.room);

           if(userlist.indexOf(data.member_id)!==-1){
             socket.on('disconnect',function(){
                console.log("중복 소켓 제거");
             })
             socket.emit('close',{
                msg : data.member_id
             })



             return;


          }



          userlist.push(data.member_id);
          chatlist.set(socket.room, userlist);




      } else {
        chatlist.set(socket.room, [data.member_id]);
      }


      console.log(chatlist);



     io.sockets.in(socket.room).emit('updateuser',{
       chatlist : chatlist.get(socket.room)

     })





      socket.on('disconnect', function(){
        var userlist = chatlist.get(socket.room)
        userlist.splice(userlist.indexOf(data.member_id),1);
        chatlist.set(socket.room, userlist);


        io.sockets.in(socket.room).emit('updateuser',{
          chatlist : chatlist.get(socket.room)

        })


        socket.broadcast.to(socket.room).emit('system',{
          msg : data.member_id + '님이 나가셨습니다.'
        })



      })

    }
  })





  socket.on('me',function(data){
    console.log(socket.room, data);

    socket.emit('me',{
      member_id:data.member_id,
      msg:data.msg,
      time:data.time
    });

    socket.broadcast.to(socket.room).emit('other',{
      member_id:data.member_id,
      msg:data.msg,
      time:data.time

    })
  })



})

http.listen(9000, function(){
  console.log('listening on *:9000');
})
