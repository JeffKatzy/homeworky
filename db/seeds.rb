t1 = Teacher.create(email: "Ruthieteach@gmail.com", name: "Jeff Katz", password: "Jeffrey", password_confirmation: "Jeffrey")
t2 = Teacher.create(email: "Ruthieteach@gmail.com", name: "Jeff Katz", password: "Jeffrey", password_confirmation: "Jeffrey")

c1 = Classroom.create(name: "gym", number: 888)
c2 = Classroom.create(name: "math", number: 777)
c3 = Classroom.create(name: "science", number: 666)
c4 = Classroom.create(name: "health", number: 555)
c5 = Classroom.create(name: "English", number: 444)

t1.classrooms = [c1, c2]
t2.classrooms = [c3, c4, c5]
