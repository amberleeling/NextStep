puts 'Seeding database...'

User.destroy_all
Job.destroy_all
Application.destroy_all

# Create users
user1 = User.create(email: 'user1@example.com', password: 'password')
user2 = User.create(email: 'user2@example.com', password: 'password')
user3 = User.create(email: 'user3@example.com', password: 'password')

# Create jobs
job1 = Job.create!(company: 'Jones, Davis and Hamilton', position: 'Data Scientist', description: 'Place common kind opportunity specific happen. Wonder whether foot anyone letter mention.
Weight Republican dream store most if. Quality marriage institution police part.', link: 'https://www.wilson.com/')
job2 = Job.create!(company: 'Higgins LLC', position: 'Backend Developer', description: 'Recently try how cut water determine technology very. Just Mrs evidence.
Far exactly buy since security. Toward one name provide song. Market director next consumer third risk.', link: 'https://www.armstrong.com/')
job3 = Job.create!(company: 'Wilson, Gomez and Patel', position: 'Product Manager', description: 'Daughter save several range yeah field look. Summer rock police employee. Positive beyond note.
Piece far party during hit clearly. Health always place drop far at form. Wrong history indicate form.', link: 'https://byrd.net/')
job4 = Job.create!(company: 'Snow-Wolf', position: 'Backend Developer', description: 'Cut day without pass.
Oil word actually candidate kind cultural consumer. Receive second different recently along care fight become.', link: 'http://rojas.net/')
job5 = Job.create!(company: 'Case, Taylor and Calhoun', position: 'Product Manager', description: 'Week so common. Let military art dream fill agreement property. Realize quite in sell result for. Worry explain join cost important quite cold million.', link: 'http://www.ortiz.biz/')

# Create applications
Application.create!(status: 'accepted', date: '2025-02-09', user: user2, job: job5)
Application.create!(status: 'accepted', date: '2025-01-07', user: user1, job: job3)
Application.create!(status: 'pending', date: '2025-03-09', user: user3, job: job2)
Application.create!(status: 'pending', date: '2025-01-20', user: user3, job: job2)
Application.create!(status: 'accepted', date: '2025-03-03', user: user3, job: job5)
Application.create!(status: 'accepted', date: '2025-01-16', user: user3, job: job2)
Application.create!(status: 'pending', date: '2025-01-25', user: user2, job: job4)
Application.create!(status: 'rejected', date: '2025-03-10', user: user1, job: job4)
Application.create!(status: 'rejected', date: '2025-02-01', user: user2, job: job3)
Application.create!(status: 'rejected', date: '2025-03-11', user: user2, job: job3)

puts 'Seeding complete.'
