gabriela=User.create(email: "johnsongabriela87@gmail.com", name: "Gabriela" ,image_url: "https://scontent.fhio2-1.fna.fbcdn.net/v/t1.0-0/c22.0.206.206a/p206x206/56790837_858973194442483_6357642360859394048_o.jpg?_nc_cat=103&_nc_sid=da31f3&_nc_ohc=pN7JNpI6uj0AX9kJKml&_nc_ht=scontent.fhio2-1.fna&oh=c6bffd050704f106005d4da68ba7f7c4&oe=5F70829E", bio: "I was the number one running back of the 2019 season", password: "16")

Post.create(title: "Savage", image_url: "https://youtu.be/EAYZcMOi0yw", description: "Sacramento vs Portland. The game right before the sacramento team folded and we went to play for portland", user_id: gabriela.id  )