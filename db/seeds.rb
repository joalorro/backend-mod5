# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Therapist.destroy_all
Patient.destroy_all
Program.destroy_all
Exercise.destroy_all
Comment.destroy_all

jane = Therapist.create( first_name: 'Jane', last_name: 'Doe', email: 'jane@doe.com', password: 'jane', license: '12345', certifications: 'OCS, CSCS', degree:'DPT')

one = Patient.create( first_name: 'Patient', last_name: 'One', email:'patient@one.com', password: 'one')
two = Patient.create( first_name: 'Patient', last_name: 'Two', email:'patient@two.com', password: 'two')
three = Patient.create( first_name: 'Patient', last_name: 'Three', email:'patient@three.com', password: 'three')

program_one = Program.create(patient: one, therapist: jane)
program_two = Program.create(patient: two, therapist: jane)
program_three = Program.create(patient: three, therapist: jane)

Exercise.create(
	name: 'Push Ups',
	desc: 'Get on the floor on all fours, positioning your hands slightly wider than your shoulders.

	Extend your legs back so that you are balanced on your hands and toes. Keep your body in a straight line from head to toe without sagging in the middle or arching your back. You can position your feet to be close together or a bit wider depending on what is most comfortable for you.

	Before you begin any movement, contract your abs and tighten your core by pulling your belly button toward your spine. Keep a tight core throughout the entire push up.

	Inhale as you slowly bend your elbows and lower yourself until your elbows are at a 90-degree angle.

	Exhale as you begin contracting your chest muscles and pushing back up through your hands to the start position.',
	url: 'https://www.youtube.com/watch?v=ABbVpmubIGQ',
	program: program_one,
)

Exercise.create(
	name: 'Sidelying External Rotation',
	desc: 'Perform the exercise with a light dumbbell.
	Lie on the side, holding the dumbbell in the hand of the upper arm.
	Position the elbow of the upper arm against the rib cage, to avoid movement other than external rotation.
	Raise hand towards the ceiling, keeping the elbow bent at 90 degrees and tucked beside the body.
	Slowly lower the weight/hand back towards the mat.',
	url: 'https://www.youtube.com/watch?v=v5bPOsQbq7g',
	program: program_one
)

Exercise.create(
	name: 'Standing Shouler Row with Rubber Bands',
	desc: 'Begin standing upright, holding both ends of a resistance band that is anchored in
	front of you at chest height, with your palms facing inward.
	Pull your arms back with your elbows tucked at your sides, then return to the starting
	position and repeat.
	*Tip*
	Make sure to keep your core engaged and focus on squeezing your shoulder blades
	together as you pull on the band.',
	url: 'https://www.youtube.com/watch?v=EsdOzif7-6s',
	program: program_one
)

Exercise.create(
	name: 'Posterior Pelvic Tilts',
	desc: 'Lie on your back with the knees bent and the soles of the feet on the floor. This is your neutral position, with the natural curve of the lumbar spine causing the low back to be slightly elevated from the floor.
	On an exhale, gently rock your hips towards your face. Your butt will not actually leave the floor, but you will feel your low back press into the floor. You are essentially taking the curve out of the low back. Think of the pelvis as a bowl of water. When you do the pelvic tilt, the water would be spilling towards your belly.
	After a few seconds, inhale and return to your neutral position.
	Repeat this movement five to 10 times.',
	url: 'https://www.youtube.com/watch?v=44s2-4rEjoo',
	program: program_two
)

Exercise.create(
	name: 'Cat/Camels',
	desc: 'Get onto your hands and knees, with your knees spaced hip-width apart and your hands directly beneath your shoulders. Tighten your abdominal muscles and arch your spine upward toward the ceiling. Hold the position for at least 10 seconds, then slowly relax your back. Allow your stomach to fall toward the floor, bring your shoulders together and stretch your back downwards into a swayback position. Hold for 10 seconds, then return to the starting position. Repeat the entire sequence at least three more times.',
	url: 'https://www.youtube.com/watch?v=CXRsjICsGnc',
	program: program_two
)