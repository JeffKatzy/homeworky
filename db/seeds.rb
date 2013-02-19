t1 = Teacher.create(email: "Ruthieteach@gmail.com", name: "Jeff Katz", password: "Jeffrey", password_confirmation: "Jeffrey")
t2 = Teacher.create(email: "Ruthieteach@gmail.com", name: "Jeff Katz", password: "Jeffrey", password_confirmation: "Jeffrey")

c1 = Classroom.create(name: "gym", number: 888)
c2 = Classroom.create(name: "math", number: 777)
c3 = Classroom.create(name: "science", number: 666)
c4 = Classroom.create(name: "health", number: 555)
c5 = Classroom.create(name: "English", number: 444)

s1 = Sms.create(incoming_number: "+12154997415", content_received: "666 Jeffrey")
s2 = Sms.create(incoming_number: "+12154997415", content_received: "555 Michelle")
s3 = Sms.create(incoming_number: "+12154997415", content_received: "444 Gary")
s4 = Sms.create(incoming_number: "+12154997415", content_received: "333 Sheldon")
s5 = Sms.create(incoming_number: "+12154997415", content_received: "777 Ruth")
s6 = Sms.create(incoming_number: "+12154997415", content_received: "blahblah")
s7 = Sms.create(incoming_number: "+12154997415", content_received: "999999999 Jeff")

student = Student.create(name: "Jeffrey Katz", cell_number: "+12154997415")
student = Student.create(name: "Jeffrey Katz", cell_number: "+12153648143")
t1.classrooms = [c1, c2]
t2.classrooms = [c3, c4, c5]
