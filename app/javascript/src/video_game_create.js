function video_game_create(e) {

    //console.log(e.target[1].value)//title:
   // console.log(e.target[2].value)year:
    //console.log(e.target[3].value)cover_photo:
   // console.log(e.target[4].value)description: 
   // console.log(e.target[5].value)price:

   const video_game = {
        video_game: {
            title:e.target[1].value,
            year:e.target[2].value,
            cover_photo:e.target[3].value,
            description: e.target[4].value,
            price:e.target[5].value,

        }
     }


    fetch(e.target.action, {
        method: e.target.method,
        headers: {
           'Accept': 'application/json',
           'Content-Type':'application/json',
           "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
        },
        body:JSON.stringify(video_game)
    })
    .then(data => data.json())
    .then( video_game => console.log (video_game))

    

       // document.querySelector('#video_games tbody').appendChild(tr)
       // document.querySelector('[type="submmit"]').disabled = false


    
   
}

export default video_game_create