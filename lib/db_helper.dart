

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabaseProvider {
  var _userDatabaseName = "fitnessDb";
  var _userTableName = "workoutsTb";
  var _waterTableName = "water";
  var _version = 2;
  late Database database;


  Future<void> open() async {
    try {
      database = await openDatabase(
        _userDatabaseName,
        version: _version,
        onCreate: (db, version) async {
          await db.execute('''
        CREATE TABLE $_userTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          type TEXT,
          name TEXT,
          img_path TEXT,
          main_img_path TEXT,
          repetitions INTEGER,
          calories INTEGER,
          description TEXT
        );
        ''');
          await db.execute('''
        CREATE TABLE $_waterTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          count INTEGER,
          time TEXT
        );
        ''');
          await db.execute(
              '''
    INSERT INTO $_userTableName (type, name, img_path, main_img_path, repetitions, calories, description) 
    VALUES 
    ("fullbody", "Jumping jacks", "assets/images/jumpingJack.png", "assets/images/main/jumpingJackMain.png", 20, "Easy | 390 Calories Burn", 
    '[
          ["Stand up straight, arms at your sides, feet shoulder-width apart." , "Pull your shoulders back and lower them along your spine. Maintain the natural curve of the neck, relaxing the jaw as well."],
          ["Jump up and stretch your arms above your head.","Put your feet shoulder-width apart, bend your knees slightly so that you can jump. When you bounce or bounce just a few inches off the ground, raise your arms above your head until they are about shoulder width apart."],
          ["Stretch out your legs.","During the jump, spread your legs wider than shoulder width and raise your arms above your head. Give way or take away a little space depending on your height and leave a lot of space between your legs."],
          ["Land in the starting position.","After jumping into the air, land gently in the first position, arms at your sides, feet shoulder width apart."]
        ]'
    ),
    ("fullbodyru", "Джек-попрыгунчик", "assets/images/jumpingJack.png", "assets/images/main/jumpingJackMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Встаньте прямо, руки по швам, ноги на ширине плеч." , "Отведите плечи назад и опустите их вдоль позвоночника. Сохраняйте естественный изгиб шеи, расслабляя также челюсть."],
          ["Подпрыгните и вытяните руки над головой.", "Поставьте ноги на ширину плеч, слегка согните колени, чтобы вы могли подпрыгнуть. Когда вы подпрыгиваете всего в нескольких дюймах от земли, поднимите руки над головой, пока они не окажутся примерно на ширине плеч."],
          ["Вытяните ноги.","Во время прыжка расставьте ноги шире, чем на ширину плеч, и поднимите руки над головой. Уступите или уберите немного места в зависимости от вашего роста и оставьте много места между ногами."],
          ["Приземляйтесь в исходное положение.","После прыжка в воздух мягко приземлитесь в первом положении, руки по швам, ноги на ширине плеч."]
        ]'
    ),
      ("fullbody", "Tricep dips", "assets/images/tricepDips.png", "assets/images/main/tricepDipsMain.png", 20,"Medium | 320 Calories Burn", 
    '[
          ["Stand in the starting position with the bench behind you.","You can use any sturdy bench or chair, for example, for training or even a park bench. You can even do it without getting out of bed."],
          ["Tighten your abs and come off the bench.","Tighten your abs to tighten them. Break away from the front edge of the bench and use your hands to lower yourself to the floor. Don go down completely."],
          ["Keep your head and upper body straight.","When you descend, make sure that your body remains upright. Look straight ahead to remind yourself not to lower your head while doing bends."],
          ["Hold in the \"leaning\" position for 1-2 seconds before pulling up again.","When you reach the bottom of the sinkhole, stay there for a couple of seconds. This will make your arm muscles work harder while you hold yourself in place. After you have held the pose, lift your body up again, while maintaining tension in the spine."]
        ]'
    ),
          ("fullbodyru", "Отжимание для трицепсов", "assets/images/tricepDips.png", "assets/images/main/tricepDipsMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Встаньте в исходное положение так, чтобы скамья была позади вас.","Вы можете использовать любую прочную скамью или стул, например, для тренировок, или даже скамейку в парке. Вы даже можете делать это, не вставая с кровати."],
          ["Напрягите мышцы пресса и встаньте со скамьи.","Напрягите мышцы пресса, чтобы подтянуть их. Оторвитесь от переднего края скамьи и используйте руки, чтобы опуститься на пол. Не опускайтесь полностью."],
          ["Держите голову и верхнюю часть туловища прямо.","Когда вы опускаетесь, убедитесь, что ваше тело остается в вертикальном положении. Смотрите прямо перед собой, чтобы напомнить себе не опускать голову при выполнении наклонов."],
          ["Задержитесь в положении "наклонившись" на 1-2 секунды, прежде чем снова подтянуться.","Когда вы достигнете дна воронки, задержитесь там на пару секунд. Это заставит мышцы рук работать интенсивнее, пока вы будете удерживать себя на месте. После того, как вы удержите позу, снова поднимите тело вверх, сохраняя напряжение в позвоночнике."]
        ]'
    ),
     ("fullbody", "Squats", "assets/images/squats.png", "assets/images/main/squatsMain.png", 20, "Easy | 115 Calories Burn", 
    '[
          ["Put your feet on the ground.","Keep your feet slightly wider than shoulder width. Straighten your back. Turn your feet slightly outward in the direction of 10 and 2 oclock, not directly in front of you."],
          ["Bend your knees.","Imagine that you are going to lean back in your chair. Do not lift your heels off the floor. Tighten your abs. Keep your back straight and in a neutral position throughout the exercise."],
          ["Descend in a controlled manner.","As you lower yourself, pull your hips back. Bend down as low as possible, keeping your shins upright and touching the floor with your heels. From the lower position, push off from the heels and slowly rise, balancing, leaning forward if necessary."],
          ["Hold in the leaning position for 1-2 seconds before pulling up again.","When you reach the bottom of the sinkhole, stay there for a couple of seconds. This will make your arm muscles work harder while you hold yourself in place. After you have held the pose, lift your body up again, while maintaining tension in the spine."]
        ]'
    ),
         ("fullbodyru", "Приседания", "assets/images/squats.png", "assets/images/main/squatsMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Поставьте ноги на землю.","Держите ноги чуть шире, чем на ширине плеч. Выпрямите спину. Слегка поверните ступни наружу в направлении 10 и 2 часов, не прямо перед собой."],
          ["Согните ноги в коленях.","Представьте, что вы собираетесь откинуться на спинку стула. Не отрывайте пятки от пола. Напрягите пресс. Держите спину прямой и в нейтральном положении на протяжении всего упражнения."],
          ["Спускайтесь контролируемым образом.","Опускаясь, отведите бедра назад. Наклонитесь как можно ниже, держа голени вертикально и касаясь пола пятками. Из нижнего положения оттолкнитесь от пяток и медленно поднимитесь, балансируя, при необходимости наклоняясь вперед."],
          ["Задержитесь в положении "наклонившись" на 1-2 секунды, прежде чем снова подтянуться.","Когда вы достигнете дна воронки, задержитесь там на пару секунд. Это заставит мышцы рук работать интенсивнее, пока вы будете удерживать себя на месте. После того, как вы удержите позу, снова поднимите тело вверх, сохраняя напряжение в позвоночнике."]
        ]'
    ),
    ("fullbody", "Mountain climbers", "assets/images/mountainClimbers.png", "assets/images/main/mountainClimbersMain.png", 20, "Easy | 115 Calories Burn", 
    '[
          ["Take the plank position.","Get down on the floor with support on your hands and knees. Straighten your legs, keeping your balance on your feet and toes. Place your palms directly under your shoulders, fingers pointing forward and slightly turned outward. Engage the muscles of the core, constantly keeping them in tension. The body should be positioned in a straight line, from the back of the head to the heels."],
          ["Pull one knee up to your chest.","Lift one leg off the floor and start bending, while pulling it up between your torso and the floor. Pull your knee forward in one smooth, controlled motion. At the same time, the knees should not fall or touch the floor. Pulling your knee up as far and high as you can, fix the abdominal muscles in tension for a short time, but with all your strength."],
          ["Repeat with the second knee.","Relax your stomach and slowly lower your knee back to the second leg. Straighten your leg and put it on the floor. Then, with a smooth movement, pull the second knee forward, while straining the abdominal muscles."],
          ["Continue to perform the movement alternately with both knees.","Return the leg to the starting position and start bending the other knee again. Repeat the movement until you master it. That`s all! Do the maximum number of repetitions possible for you, until your muscles are tired, and gradually try to increase this number. This exercise will perfectly complement any strength or endurance training."]
        ]'
    ),
        ("fullbodyru", "Альпинист", "assets/images/mountainClimbers.png", "assets/images/main/mountainClimbersMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Примите положение доски.","Опуститесь на пол, опираясь на руки и колени. Выпрямите ноги, сохраняя равновесие на ступнях и носках. Положите ладони прямо под плечи, пальцы направлены вперед и слегка повернуты наружу. Задействуйте мышцы кора, постоянно держа их в напряжении. Тело должно располагаться по прямой линии, от затылка до пяток."],
          ["Подтяните одно колено к груди.","Оторвите одну ногу от пола и начните сгибать, одновременно подтягивая ее вверх между туловищем и полом. Вытяните колено вперед одним плавным, контролируемым движением. В то же время колени не должны опускаться или касаться пола. Подтягивая колено как можно дальше и выше, зафиксируйте мышцы брюшного пресса в напряжении на короткое время, но изо всех сил."],
          ["Повторите со вторым коленом.","Расслабьте живот и медленно опустите колено обратно ко второй ноге. Выпрямите ногу и поставьте ее на пол. Затем плавным движением вытяните второе колено вперед, одновременно напрягая мышцы живота."],
          ["Продолжайте выполнять движение поочередно обоими коленями.","Верните ногу в исходное положение и снова начинайте сгибать другое колено. Повторяйте движение, пока не освоите его. Вот и все! Делайте максимально возможное для вас количество повторений, пока ваши мышцы не устанут, и постепенно старайтесь увеличивать это количество. Это упражнение прекрасно дополнит любую силовую тренировку или тренировку на выносливость."]
        ]'
    ),
     ("fullbody", "Modified v-sits", "assets/images/modifiedSits.png", "assets/images/main/modifiedMain.png", 20, "Easy | 115 Calories Burn", 
    '[
          ["Work on the lower abdomen with various exercises.","The rectus abdominis muscle (your \"six-point\" muscle) stretches from the lower part of the chest down to the pelvis."],
          ["Perform leg lifts.","Start by lying flat on your back. You can use the mat for comfort. Press your palms to your sides, face down.\nLift your feet off the floor so that they point directly at the ceiling. Your body should form the letter \"L\".\nConcentrating on using the muscles of the lower abdomen, gently lift your hips off the floor, keeping your legs straight. Hold for a second, then lower your hips back to the floor. Perform smooth, controlled movements - do not jump or twitch."],
          ["Perform reverse twists.","Start by lying on your back with your legs raised in the \"tabletop\" position - legs raised, knees bent. In other words, your hips should form a 90-degree angle with the ground, and your shins should form a 90-degree angle with your hips.\nSpread your arms wide so that your palms touch the ground. This will provide a wide base that will help you keep your balance.\nKeeping your upper back still, use your lower abs to lift your hips off the floor. The knees should be pressed against the chest.\nHold this position for a second, then gently lower your hips back to the ground."],
          ["Perform a V-shaped abdominal hold.","Start by lying flat on your back.\nWith both hands at your sides, gently and gently lift both legs and torso about 45 degrees off the floor. Your body should form the letter \"V\", your hips should touch the floor. Keep your legs straight and maintain a strong, balanced posture.\nTighten your abs and use your arms to keep your balance. Some people find it easier to keep their balance if they stretch their arms parallel to the floor, pointing in the direction of their feet. However, if you do this, do not support your legs with your hands at all.\nHold this position. Hold this position until you feel a burn, usually from 30 seconds to 2 minutes. Repeat if necessary."]
        ]'
    ),
         ("fullbodyru", "Сед с высоким углом", "assets/images/modifiedSits.png", "assets/images/main/modifiedMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Поработайте над нижней частью живота с помощью различных упражнений.","Прямая мышца живота (ваша "шеститочечная" мышца) тянется от нижней части грудной клетки вниз к тазу."],
          ["Выполняйте подъемы ног.","Начните с того, что лягте на спину. Для удобства можно использовать коврик. Прижмите ладони к бокам лицом вниз.Оторвите ступни от пола так, чтобы они были направлены прямо в потолок. Ваше тело должно образовывать букву "L".Концентрируясь на использовании мышц нижней части живота, осторожно оторвите бедра от пола, держа ноги прямыми. Задержитесь на секунду, затем опустите бедра обратно на пол. Выполняйте плавные, контролируемые движения - не прыгайте и не дергайтесь."],
          ["Выполните обратные скручивания.","Начните с того, что лягте на спину с поднятыми ногами в положении "столешница" - ноги подняты, колени согнуты. Другими словами, ваши бедра должны образовывать угол 90 градусов с землей, а голени должны образовывать угол 90 градусов с бедрами. Разведите руки в стороны так, чтобы ладони касались пола. Это обеспечит широкое основание, которое поможет вам сохранить равновесие. Удерживая верхнюю часть спины неподвижной, используйте нижнюю часть пресса, чтобы оторвать бедра от пола. Колени должны быть прижаты к груди. Задержитесь в этом положении на секунду, затем осторожно опустите бедра обратно на землю."],
          ["Выполните V-образный захват живота.","Начните с того, что лягте на спину. Держа обе руки по бокам, осторожно приподнимите обе ноги и туловище примерно на 45 градусов от пола. Ваше тело должно образовывать букву "V", бедра должны касаться пола. Держите ноги прямыми и поддерживайте сильную, сбалансированную осанку. Напрягите мышцы пресса и используйте руки для удержания равновесия. Некоторым людям легче сохранять равновесие, если они вытягивают руки параллельно полу, указывая в направлении своих стоп. Однако, если вы делаете это, ни в коем случае не поддерживайте ноги руками. Задержитесь в этом положении. Удерживайте это положение, пока не почувствуете жжение, обычно от 30 секунд до 2 минут. При необходимости повторите."]
        ]'
    ),
    ("fullbody", "Push ups with rotation", "assets/images/pushUps.png", "assets/images/main/pushRotationMain.png", 20, "Easy | 115 Calories Burn", 
    '[
          ["Start in the push-up position","Hands and feet on the ground Hands, elbows and shoulders should be in line."],
          ["Keep your elbows slightly bent","Start bending at the elbows to lower your body to the ground. It is important that the body remains in a straight line. Do not lower your hips to the floor and do not stretch your neck forward, thinking that you are sinking deeper."],
          ["At the bottom of the push-ups","Start pushing your palms into the ground to lift your body up and straighten your arms."],
          ["At the top of the push-ups","Push one palm into the ground and start rotating the other arm while rotating the torso. The body must be in the \"T\" position."],
          ["Turn around","Put your hand on the ground, then change sides."]
        ]'
    ),
        ("fullbodyru", "Отжимания с вращением", "assets/images/pushUps.png", "assets/images/main/pushRotationMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Начните с положения отжимания","Руки и ноги на полу Кисти, локти и плечи должны находиться на одной линии."],
          ["Держите локти слегка согнутыми","Начните сгибаться в локтях, чтобы опустить тело к земле. Важно, чтобы тело оставалось на прямой линии. Не опускайте бедра к полу и не вытягивайте шею вперед, думая, что вы опускаетесь глубже."],
          ["В нижней части отжиманий","Начните упираться ладонями в землю, чтобы приподнять туловище и выпрямить руки."],
          ["В верхней части отжиманий","Упритесь одной ладонью в землю и начинайте вращать другой рукой, одновременно поворачивая туловище. Корпус должен находиться в положении "Т"."],
          ["Обернуться","Положите руку на землю, затем поменяйтесь сторонами."]
        ]'
    ),
    ("fullbody", "Up & down planks", "assets/images/upDown.png", "assets/images/main/upPlanksMain.png", 20, "Easy | 115 Calories Burn", 
    '[
          ["Begin on all fours.","If you are new to yoga or not especially flexible, prepare yourself to perform plank pose by starting on all fours. Make sure that you will be comfortable by using a yoga mat. You may also place a folded up blanket under your knees if you need some extra padding for your knees."],
          ["Exhale and push back to child’s pose.","To do child’s pose, or balasana, remain on your hands and knees and move your bottom back towards your feet. Allow your thighs to spread out to the same width as your shoulders as you do this and sink your chest towards the mat. Your hand should stay out in front of you with your palms on the yoga mat."],
          ["Hinge forward to plank pose.","When you are ready, push your body up from childs pose and back onto your hands and knees. Then, move into a plank pose, or kumbhakasana. Position your shoulders over your hands and straighten your legs as you rise up onto the balls of your feet. When you are in position, you should look like you are preparing to do a push up."],
          ["Drop down to your forearms if desired.","You can stay up on the palms of your hands if you want, or you can drop down onto your forearms to make the plank a little more challenging. This variation is called the dolphin plank pose"],
          ["Return to childs pose.","After you’ve stayed in plank for three to five breaths, exhale, get onto your hands and knees, and then hinge back to child’s pose. Give your body a chance to rest in child’s pose for a few breaths before you proceed with any further poses."],
          ["Try advanced plank poses.","Once youve mastered the full plank, you can challenge yourself with more difficult variations. Dont progress to these until you are strong enough to keep your body straight and stable throughout the entire movement."],
          ["Finish your plank practice.","After you’ve done a few rounds of plank pose, finish your practice. From the plank pose, gently lower your knees to the floor. Then, transition into child’s pose again and breathe. Take three to five breaths in child’s pose to complete your routine."]
        ]'
    ),
        ("fullbodyru", "Верхние и нижние планки", "assets/images/upDown.png", "assets/images/main/upPlanksMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Начните с четверенек.","Если вы новичок в йоге или не обладаете особой гибкостью, подготовьтесь к выполнению позы планки, встав на четвереньки. Убедитесь, что вам будет удобно, используя коврик для йоги. Вы также можете подложить под колени сложенное одеяло, если вам нужна дополнительная подкладка для коленей."],
          ["Выдохните и вернитесь в позу ребенка.","Чтобы выполнить позу ребенка, или баласану, оставайтесь на четвереньках и подтяните ягодицы к ступням. При выполнении этого упражнения разведите бедра на ту же ширину, что и плечи, и прижмите грудь к коврику. Ваша рука должна оставаться вытянутой перед вами, ладони должны лежать на коврике для йоги."],
          ["Наклонитесь вперед в позу доски.","Когда вы будете готовы, поднимите свое тело из позы ребенка и снова встаньте на четвереньки. Затем примите позу доски или кумбхакасану. Положите плечи на руки и выпрямите ноги, поднимаясь на подушечки стоп. Когда вы находитесь в нужном положении, вы должны выглядеть так, как будто готовитесь отжаться."],
          ["При желании опуститесь до предплечий.","Вы можете оставаться на ладонях, если хотите, или опуститься на предплечья, чтобы сделать планку немного более сложной. Эта вариация называется позой планки дельфина"],
          ["Вернитесь в позу ребенка.","После того, как вы задержитесь в положении планки на три-пять вдохов, выдохните, встаньте на четвереньки, а затем вернитесь в позу ребенка. Дайте своему телу возможность отдохнуть в позе ребенка в течение нескольких вдохов, прежде чем переходить к дальнейшим позам."],
          ["Попробуйте продвинутые позы на доске.","Как только вы освоите планку полностью, вы сможете испытать себя в более сложных вариациях. Не переходите к ним, пока не наберетесь достаточно сил, чтобы держать тело прямо и устойчиво на протяжении всего движения."],
          ["Закончите тренировку по планке.","После того, как вы выполните несколько кругов в позе планки, завершите упражнение. Из позы планки осторожно опустите колени на пол. Затем снова примите позу ребенка и вдохните. Сделайте три-пять вдохов в позе ребенка, чтобы завершить упражнение."]
        ]'
    ),
    ("lowebody", "Bottom to heels stretch", "assets/images/bottoomStretch.png", "assets/images/main/bottomHeelsMain.png", 20, "Easy | 390 Calories Burn", 
      '[
            ["Get on all fours.","With your hands directly under your shoulders and your knees under your hips."],
            ["Keeping your back and neck straight.","slowly move your bottom back towards your heels, leaving your arms outstretched in front."],
            ["Stretch out your legs.","During the jump, spread your legs wider than shoulder width and raise your arms above your head. Give way or take away a little space depending on your height and leave a lot of space between your legs."],
            ["Hold this position.","For 5-10 seconds and return to the starting position.\nRepeat this 8-10 times."]
          ]'
    ),
        ("lowebodyru", "Растягивается от низа до пяток", "assets/images/bottoomStretch.png", "assets/images/main/bottomHeelsMain.png", 20, "Легко | Сжигается 390 калорий ", 
      '[
            ["Встань на четвереньки.","Положите руки прямо под плечи, а колени - под бедра."],
            ["Держите спину и шею прямыми.","Медленно отведите ягодицы назад к пяткам, оставляя руки вытянутыми вперед."],
            ["Вытяните ноги.","Во время прыжка расставьте ноги шире, чем на ширину плеч, и поднимите руки над головой. Уступите или уберите немного места в зависимости от вашего роста и оставьте много места между ногами."],
            ["Удерживайте это положение.","Задержитесь на 5-10 секунд и вернитесь в исходное положение. Повторите упражнение 8-10 раз."]
          ]'
    ),
           ("lowebody", "Opposite arm / leg raises", "assets/images/legRaises.png",  "assets/images/main/legRaisesMain.png", 20, "Easy | 390 Calories Burn", 
    '[
          ["Stand on your hands.","And knees, tighten your abdominal muscles, place your arms directly under your shoulders, and take your shoulders off the floor."],
          ["At the same time.","Raise your left arm straight up in front of you and extend your right leg into the air behind you until they are parallel to the ground."],
          ["Stretch out your legs.","During the jump, spread your legs wider than shoulder width and raise your arms above your head. Give way or take away a little space depending on your height and leave a lot of space between your legs."],
          ["Slowly return to the starting position.","Repeat with your right arm and left leg.\nDo the exercise with the required number of repetitions on each side. Try to keep your torso from moving during the exercise. Strain your abdominal muscles to stabilize your spine."]
        ]'
      ),
           ("lowebodyru", "Противоположные подъемы рук/ног", "assets/images/legRaises.png",  "assets/images/main/legRaisesMain.png", 20, "Легко | Сжигается 390 калорий", 
    '[
          ["Встаньте на руки.","И колени, напрягите мышцы живота, положите руки прямо под плечи и оторвите плечи от пола."],
          ["В то же время.","Поднимите левую руку прямо перед собой и вытяните правую ногу в воздух позади себя, пока они не окажутся параллельны земле."],
          ["Вытяните ноги.","Во время прыжка расставьте ноги шире, чем на ширину плеч, и поднимите руки над головой. Уступите или уберите немного места в зависимости от вашего роста и оставьте много места между ногами."],
          ["Медленно вернитесь в исходное положение.","Повторите упражнение правой рукой и левой ногой.
Выполняйте упражнение с необходимым количеством повторений с каждой стороны. Старайтесь не двигать туловищем во время выполнения упражнения. Напрягите мышцы живота, чтобы стабилизировать позвоночник."]
        ]'
      ),
     ("lowebody", "Back extensions", "assets/images/backExtensions.png",  "assets/images/main/backExtensionMain.png", 20, "Easy | 390 Calories Burn", 
     '[
          ["Lie on your stomach.","And straighten your legs."],
          ["Put your hands behind your head.","To complicate the exercise, you can pull them forward in front of you."],
          ["Lift your upper body smoothly.","Look forward, and relax your neck."],
          ["Hold at the highest point","For 10-15 seconds and slowly return to the starting position."]
        ]'
    ),
         ("lowebodyru", "Обратная экстензия", "assets/images/backExtensions.png",  "assets/images/main/backExtensionMain.png", 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Лягте на живот.","И выпрямите ноги."],
          ["Заведите руки за голову.","Чтобы усложнить упражнение, вы можете вытянуть их вперед перед собой."],
          ["Плавно поднимайте верхнюю часть туловища.","Посмотрите вперед и расслабьте шею."],
          ["Удерживайте в самой высокой точке","Задержитесь на 10-15 секунд и медленно вернитесь в исходное положение."]
        ]'
    ),
    ("lowebody", "Bridges", "assets/images/bridges.png",  "assets/images/main/bridgesMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Take the emphasis lying on your back.","It is recommended to use a yoga mat when performing this element, although any carpet will do to protect your back from possible injuries when working on a hard and hard surface. Once you have accepted the emphasis lying on your back, bend your knees and spread your hips apart, firmly resting your feet on the floor. Position your heels of your feet as close to your buttocks as possible, or simply move your buttocks towards your heels. Engage the muscles of your buttocks to push your hips up."],
          ["The hands should rest peacefully on the sides of the body.","You can move your hands closer to your hips, resting your palms on the floor to help yourself keep your balance in an unusual position for yourself. Lock your shoulder blades together, which will direct your shoulders down to the floor. You can also lean on your hands and help yourself to control the process of doing the exercise."],
          ["Lift your hips up.","You should tilt your pelvis slightly towards your face. Aim to touch your spine with your navel, which activates the abdominal muscles. Resting your feet on the floor, bring your hips to the highest comfortable position. Imagine that you need to touch the ceiling or the sky with your hips. Slightly tighten your buttocks while performing this movement."],
          ["Keep your knees and hips in a parallel position to each other.","Do not let them spread apart, which can result in knee or back injury, shoulders should be positioned on the floor to protect your neck."],
          ["Fix this position for 5 full breaths and exhalations, and then return to the starting position.","Stretch your legs straight and rest a little."]
        ]'
    ),
        ("lowebodyru", "Мостик", "assets/images/bridges.png",  "assets/images/main/bridgesMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Примите упор лежа на спине.","При выполнении этого элемента рекомендуется использовать коврик для йоги, хотя подойдет любой ковер, чтобы защитить вашу спину от возможных травм при работе на твердой поверхности. Как только вы примете упор лежа на спине, согните колени и разведите бедра в стороны, твердо упираясь ступнями в пол. Расположите пятки ног как можно ближе к ягодицам или просто подтяните ягодицы к пяткам. Напрягите мышцы ягодиц, чтобы поднять бедра вверх."],
          ["Руки должны спокойно лежать по бокам туловища.","Вы можете переместить руки ближе к бедрам, упираясь ладонями в пол, чтобы помочь себе сохранить равновесие в необычном для себя положении. Сведите лопатки вместе, что направит ваши плечи вниз, к полу. Вы также можете опереться на руки и помочь себе контролировать процесс выполнения упражнения."],
          ["Поднимите бедра вверх.","Вам следует слегка наклонить таз к лицу. Старайтесь касаться пупком позвоночника, что активизирует мышцы брюшного пресса. Упираясь ступнями в пол, приведите бедра в максимально удобное положение. Представьте, что вам нужно коснуться бедрами потолка или неба. Слегка напрягите ягодицы, выполняя это движение."],
          ["KДержите колени и бедра в параллельном положении друг к другу.","Не позволяйте им раздвигаться, что может привести к травме колена или спины, плечи должны располагаться на полу, чтобы защитить шею."],
          ["Зафиксируйте это положение на 5 полных вдохов и выдохов, а затем вернитесь в исходное положение.","Вытяните ноги прямо и немного отдохните."]
        ]'
    ),
    ("lowebody", "Knee rolls", "assets/images/kneeRolls.png",  "assets/images/main/kneeRollsMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
         ["Lie on your back.","Relax your knees and arms in the rear position (above your head)."],
         ["Wrap one knee inwards.","(Or let it fall between your feet), then lift the same knee and let it fall again, etc. The stomach should lift the relaxed knee, and gravity should partially perform the fall."],
         ["Do the exercise.","On one knee 20 to 50 times."],
         ["Keep your knees and hips in a parallel position to each other.","Do not let them spread apart, which can result in knee or back injury, shoulders should be positioned on the floor to protect your neck."],
         ["Then lift the used leg.","And feel light and relaxed. This leg will feel much longer than an unused leg."]
       ]'),
       
           ("lowebodyru", "Бросок колена", "assets/images/kneeRolls.png",  "assets/images/main/kneeRollsMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
         ["Лягте на спину.","Расслабьте колени и руки в заднем положении (над головой)."],
         ["Заверните одно колено внутрь.","(Или дайте ему упасть между ваших ног), затем поднимите то же колено и снова опустите его и т.д. Живот должен приподнимать расслабленное колено, а сила тяжести должна частично выполнять падение."],
         ["Выполните упражнение.","Встаньте на одно колено от 20 до 50 раз."],
         ["Держите колени и бедра в параллельном положении друг к другу.","Не позволяйте им раздвигаться, что может привести к травме колена или спины, плечи должны располагаться на полу, чтобы защитить шею."],
         ["Затем поднимите использованную ногу.","И почувствуйте легкость и расслабление. Эта нога будет казаться намного длиннее, чем неиспользуемая."]
       ]'),
       
    ("ab", "Sit-ups", "assets/images/sitUps.png",  "assets/images/main/sitUpMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Start by lying on your back with your knees bent.","Sit ups work best if you do them on a soft surface, such as a mattress. Keep your knees bent at a 90-degree angle, with your feet flat on the floor."],
          ["Put your fingertips on the back of your ears.","Your elbows should be bent and pointing out at your sides. Cupping the back of your ears with your fingertips — as opposed to placing them on the back of your head — can help prevent you from pulling yourself up by your neck as you’re doing sit ups."],
          ["Lift your torso up as close to your thighs as possible.","Do this with a smooth, steady motion, keeping your feet flat on the floor. When you’re done lifting your torso, your lower back should be off the floor."],
          ["Lower your torso down to the floor so you’re back in the starting position.","Like you did when you lifted your torso up to your thighs, use a smooth and steady motion as you lower it down."]
        ]'),
           ("abru", "Поднимание корпуса", "assets/images/sitUps.png",  "assets/images/main/sitUpMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Начните с того, что лягте на спину, согнув колени.","Приседания получаются лучше всего, если вы выполняете их на мягкой поверхности, такой как матрас. Держите колени согнутыми под углом 90 градусов, ступни ровно на полу."],
          ["Положите кончики пальцев на тыльную сторону ушей.","Ваши локти должны быть согнуты и направлены в стороны. Обхватите кончиками пальцев заднюю часть ушей — в отличие от того, чтобы класть их на затылок, — это поможет вам не подтягиваться за шею, когда вы делаете приседания."],
          ["Поднимите туловище как можно ближе к бедрам.","Делайте это плавными, устойчивыми движениями, не отрывая ступней от пола. Когда вы закончите поднимать туловище, нижняя часть спины должна оторваться от пола."],
          ["Опустите туловище на пол, чтобы вернуться в исходное положение.","Как вы делали, когда поднимали туловище до бедер, плавными и уверенными движениями опускайте его вниз."]
        ]'),
       
    ("ab", "Flutter kicks", "assets/images/flutterKicks.png",  "assets/images/main/flutterKicksMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Start by lying on your back with your knees bent.","Sit ups work best if you do them on a soft surface, such as a mattress. Keep your knees bent at a 90-degree angle, with your feet flat on the floor."],
          ["Put your fingertips on the back of your ears.","Your elbows should be bent and pointing out at your sides. Cupping the back of your ears with your fingertips — as opposed to placing them on the back of your head — can help prevent you from pulling yourself up by your neck as you’re doing sit ups."],
          ["Lift your torso up as close to your thighs as possible.","Do this with a smooth, steady motion, keeping your feet flat on the floor. When you’re done lifting your torso, your lower back should be off the floor."],
          ["Lower your torso down to the floor so you’re back in the starting position.","Like you did when you lifted your torso up to your thighs, use a smooth and steady motion as you lower it down."]
        ]'),
        
    ("abru", "Махи ногами лежа на спине", "assets/images/flutterKicks.png",  "assets/images/main/flutterKicksMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Сначала убедитесь, что вы разогрелись.","Для тренировки пресса включите в разминку динамическую растяжку, которая нацелит ваши мышцы брюшного пресса и подготовит их к более интенсивной работе."],
          ["Опустите руки по бокам.","И подложите руки ладонями вниз под заднюю часть для амортизации и большей устойчивости."],
          ["Поднимите ноги.","Таким образом, они зависают всего в нескольких дюймах от земли, и поднимите плечи и верхнюю часть туловища от земли, чтобы задействовать верхнюю часть брюшного пресса. Убедитесь, что вы не хрустите шеей — держите ее длинной и мягкой, она является продолжением вашего позвоночника. Попробуйте зафиксировать взгляд на том месте, где сходятся стена и потолок; это поможет вам правильно расположить голову."],
          ["Двигайте ногами вверх-вниз.","Держите их прямыми, а движение равномерным. Во время выполнения удара медленно поднимайте ноги выше от земли. Если это поможет, вы можете представить, что поднимаетесь по стене или склону."]
        ]'),



    ("ab", "Leg raises", "assets/images/legRaises.png", "assets/images/main/legRaisesMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Complete lying leg raises if you don`t have a chin-up bar.","Lay on an exercise mat or a workout bench."],
          ["Place your hands.","Beneath your lower buttocks to help support your pelvis. Keep your legs straight and your feet together."],
          ["Tighten your core.","And lift your legs to a 60 to 70-degree angle. Hold this position for 3 to 5 seconds, and then lower your legs back down to complete 1 rep."]
        ]'),
        
     ("abru", "Подъем ног", "assets/images/legRaises.png", "assets/images/main/legRaisesMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Выполняйте подъемы ног лежа, если у вас нет планки для подтягивания подбородка.","Лягте на коврик для упражнений или скамью для разминки."],
          ["PПоложите свои руки.","Подложите под нижнюю часть ягодиц, чтобы поддержать таз. Держите ноги прямыми, а ступни вместе."],
          ["Напрягите свое ядро.","И поднимите ноги под углом 60-70 градусов. Задержитесь в этом положении на 3-5 секунд, а затем опустите ноги обратно вниз, выполнив 1 повторение."]
        ]'),
        
        
        
        
    ("ab", "Bicycle crunches", "assets/images/bicycleCruches.png", "assets/images/main/bicycleCrunchesMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Lie flat on the floor and lace your hands behind your head.","Spread your elbows wide as you bring your hands behind your head. Lightly touch the back of your head with your fingers and palms."],
          ["Bend your knees up at a 90-degree angle.","Keep your feet planted on the floor as you bring your knees up so they form the peak of a triangle. Your feet should be flat and about shoulder-width apart on the floor."],
          ["Lift your legs up and away from your body.","Once your knees are bent, lift your feet up so your legs are extended and slightly bent at the knee. Avoid straightening your legs so much that your hamstrings feel tight."],
          ["Bring your right knee to your chest and touch your left elbow to it.","Twist your torso as you draw in your knee. At the same time, rotate your left elbow to touch your right knee."],
          ["Alternate the crunch by touching the other knee with the opposite elbow.","Release the crunch and bring your other knee in towards your chest as you touch the opposite elbow to it. Extend the leg that`s not tucked in so it`s pushed away from your body as though youre pedaling a bike."]
        ]'),
        
     ("abru", "Велосипед", "assets/images/bicycleCruches.png", "assets/images/main/bicycleCrunchesMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Лягте плашмя на пол и заведите руки за голову.","Широко разведите локти и заведите руки за голову. Слегка коснитесь затылка пальцами и ладонями."],
          ["Согните ноги в коленях под углом 90 градусов.","Поставьте ступни на пол и поднимите колени так, чтобы они образовали вершину треугольника. Ваши ступни должны стоять на полу ровно и примерно на ширине плеч."],
          ["Поднимите ноги вверх и отведите их от туловища.","Как только ваши колени согнутся, поднимите ступни вверх, чтобы ноги были вытянуты и слегка согнуты в коленях. Избегайте выпрямления ног настолько сильно, чтобы ваши подколенные сухожилия ощущались напряженными."],
          ["Подтяните правое колено к груди и прикоснитесь к нему левым локтем.","Поворачивайте туловище, втягивая колено. В то же время поверните левый локоть, чтобы коснуться правого колена."],
          ["Чередуйте ноги, касаясь другого колена противоположным локтем.","Отпустите ноги и подтяните другое колено к груди, касаясь противоположного локтя. Вытяните ногу, которая не согнута, так, чтобы она была отведена от вашего тела, как будто вы крутите педали велосипеда."]
        ]'),   
        
        
        
        
    ("ab", "Knee crunches", "assets/images/kneeCrunches.png", "assets/images/main/kneeCruchesMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Lie with your back flat on the ground and your legs raised.","For the sake of comfort, lie on a carpeted section of floor or on a yoga mat. Bend your legs and draw up your knees until they’re directly over your pelvis. Bend your knees at a 90-degree angle so that your feet are sticking straight out."],
          ["Hold your hands behind your head and look toward your stomach.","To get your torso into position for elbow-to-knee crunches, stretch your arms up behind you. Then, bend your elbows and hold both hands behind your head. Bend your neck so that you are looking down your body towards your belly button."],
          ["Contract your abs and bring your knees up to your elbows.","Keep your chin down and tense your abdominal muscles. Keep your abs activated the whole time while you`re doing the exercise. To do a crunch, keep your elbows in place and lift your knees upward until your elbows and knees touch. You should feel a slight burn in your lower abs as you touch your elbows and knees together."],
          ["Lower your body back to its starting position.","After you’ve completed 1 crunch, slowly relax your abdominal muscles and lower your head back down to the ground. Also lower your knees until they’re again directly above your pelvis."]
        ]'),
        
     ("abru", "Скручивание", "assets/images/kneeCrunches.png", "assets/images/main/kneeCruchesMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Лягте спиной на землю и поднимите ноги.","Для удобства лягте на покрытый ковром участок пола или на коврик для йоги. Согните ноги и подтяните колени, пока они не окажутся прямо над тазом. Согните колени под углом 90 градусов так, чтобы ступни торчали прямо наружу."],
          ["Заведите руки за голову и посмотрите на свой живот.","Чтобы привести туловище в положение для сгибания локтей в коленях, вытяните руки за собой. Затем согните локти и заведите обе руки за голову. Согните шею так, чтобы вы смотрели вниз по телу в направлении пупка."],
          ["Напрягите мышцы пресса и подтяните колени к локтям.","Опустите подбородок и напрягите мышцы живота. Все время, пока вы выполняете упражнение, держите пресс в напряжении. Чтобы выполнить хруст, держите локти на месте и поднимайте колени вверх, пока локти и колени не соприкоснутся. Вы должны почувствовать легкое жжение в нижней части пресса, когда будете соприкасаться локтями и коленями."],
          ["Опустите свое тело обратно в исходное положение.","После того, как вы выполните 1 скручивание, медленно расслабьте мышцы живота и опустите голову обратно на землю. Также опускайте колени, пока они снова не окажутся прямо над тазом."]
        ]'),
        
             
        
    ("ab", "Leg pull-ins", "assets/images/legPull.png", "assets/images/main/legPullMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Lie on your back.","On a flat bench."],
          ["Put your feet on the surface.","Of the bench, bend your knees and touch each other."],
          ["Put your hands behind your head.","And grab the bench with your palms facing each other. The elbows bend at the same time."],
          ["Pull in the abdomen.","To contract the abdominal muscles.\nStretch your legs into the air, slowly lifting your hips off the bench. At the same time, the press should remain tense. The lower parts of the legs should be facing the ceiling.\nPoint the toes towards the shins."]
        ]'),
        
        
     ("abru", "Подъем ног вверх в упоре сзади", "assets/images/legPull.png", "assets/images/main/legPullMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Лягте на спину.","На плоской скамье."],
          ["Поставьте ноги на поверхность.","Встаньте на скамью, согните ноги в коленях и коснитесь друг друга."],
          ["Встаньте на скамью, согните ноги в коленях и коснитесь друг друга.","И возьмитесь за скамью ладонями друг к другу. Одновременно согните локти."],
          ["Втяните живот.","Чтобы напрячь мышцы живота. Вытяните ноги в воздух, медленно отрывая бедра от скамьи. В то же время пресс должен оставаться напряженным. Нижние части ног должны быть обращены к потолку. Направьте пальцы ног к голеням."]
        ]'),
        
        
    ("ab", "Plank arm lifts", "assets/images/plankArm.png", "assets/images/main/plankArmMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Place your hands on the ground in front of you.","Your hands should be directly underneath you and just a little wider than your shoulders. Imagine you are about to do a pushup, since the starting position for a plank is the same. Like the name implies, the plank involves holding your body as straight as a plank."],
          ["Put your legs out straight behind you.","Your toes should be firmly planted on the floor, with your legs extending straight back. Avoid pointing your buttocks to the ceiling or letting them fall to the floor. You want to have your legs pointing straight behind you and your entire torso straight as a plank. You dont want to push your weight back onto your heels, since this will reduce the workout for your abdominal muscles. Squeeze your abdominal muscles and glutes in order to benefit from the exercise and avoid injury."],
          ["Make sure you are straight as a plank.","Check that your head is in line with your back, rather than falling to the floor. To ensure your head is in the right position, let your gaze fall to the floor about a foot down from your hands while maintaining a straight but relaxed neck. Continue holding the pose for as long as you are able. If you feel quite comfortable with your plank, you can go ahead and move on to the arm circles."],
          ["Choose a weight.","You can do arm circles with or without a weight. If you are doing this exercise for the first time, it is best to just use your body weight. If you have been doing the exercise for a while and it is getting easy, you could hold a water bottle while doing the arm circles or use a small amount of weight."],
          ["Move gradually from small circles to large circles.","To prevent mistakes in form that can lead to injury, the range of motion in the circling arm should be increased gradually. Start with small circles in a comfortable range of motion and work up to larger circles. Be sure to keep the hand on the floor directly under your shoulder, not in front of it."],
          ["Do the arm circles with your left hand.","With your body weight on the right hand and your core muscles engaged, make a circle with your left hand. Imagine you are doing a windmill pitch in a baseball game, since it is a similar motion. Start by pointing your fingers towards the front of the room. Then, gradually move your arm towards the ceiling. Then, move your arm behind you towards the back of the room, and then back into the starting position. The motion should be continuous, so don’t stop at any point in the arm circle."]
        ]'),
        
        
     ("abru", "Боковая планка на локтях", "assets/images/plankArm.png", "assets/images/main/plankArmMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Положите руки на землю перед собой.","Ваши руки должны находиться прямо под вами и чуть шире плеч. Представьте, что вы собираетесь отжаться, поскольку исходное положение для планки такое же. Как следует из названия, планка предполагает, что ваше тело должно быть прямым, как доска."],
          ["Вытяните ноги прямо за собой.","Пальцы ног должны быть плотно прижаты к полу, ноги вытянуты прямо назад. Старайтесь не поднимать ягодицы к потолку и не позволять им опускаться на пол. Вы хотите, чтобы ваши ноги были направлены прямо за спину, а весь ваш торс был прямым, как доска. Вы не хотите переносить свой вес обратно на пятки, так как это уменьшит нагрузку на мышцы брюшного пресса. Напрягите мышцы брюшного пресса и ягодичные мышцы, чтобы получить пользу от упражнения и избежать травм."],
          ["Убедитесь, что вы прямые, как доска.","Убедитесь, что ваша голова находится на одной линии со спиной, а не опускается на пол. Чтобы убедиться, что ваша голова находится в правильном положении, опустите взгляд на пол примерно на фут ниже ваших рук, сохраняя прямую, но расслабленную шею. Продолжайте удерживать позу так долго, как сможете. Если вы чувствуете себя вполне комфортно на доске, можете переходить к круговым упражнениям для рук."],
          ["Переместите вес.","Вы можете выполнять круговые движения руками с отягощением или без него. Если вы выполняете это упражнение впервые, лучше всего использовать вес своего тела. Если вы выполняете упражнение уже некоторое время и оно становится легким, вы можете держать бутылку с водой во время выполнения кругов руками или использовать небольшой вес."],
          ["Постепенно переходите от маленьких кругов к большим.","Чтобы избежать ошибок в форме, которые могут привести к травме, диапазон движений в круговой руке следует постепенно увеличивать. Начните с небольших кругов в удобном диапазоне движений и переходите к большим кругам. Обязательно держите руку на полу прямо под плечом, а не перед ним."],
          ["Делайте круговые движения левой рукой.","Перенеся вес тела на правую руку и задействовав основные мышцы, сделайте круг левой рукой. Представьте, что вы выполняете подачу ветряной мельницы в бейсбольном матче, поскольку это похожее движение. Начните с того, что направьте пальцы в переднюю часть комнаты. Затем постепенно поднимите руку к потолку. Затем отведите руку за спину в дальний конец комнаты, а затем вернитесь в исходное положение. Движение должно быть непрерывным, поэтому не останавливайтесь ни в одной точке круга."]
        ]'),
        
        
     ("ab", "Elbow plank", "assets/images/elbowPlank.png", "assets/images/main/elbowPlankMain.png" , 20, "Easy | 390 Calories Burn", 
     ' [
          ["Balance on your forearms and your toes with your body off the ground.","Start by lying on your stomach with your forearms underneath you. Keep your elbows directly underneath your shoulders with your palms down. Engage your abs and your torso to rise up onto your toes, keeping your hips and stomach off the ground. Squeeze your legs and your glutes to keep your body in a straight line."]
        ]'),
        
     ("abru", "Планка на локтях", "assets/images/elbowPlank.png", "assets/images/main/elbowPlankMain.png" , 20, "Легко | Сжигается 390 калорий", 
     ' [
          ["Балансируйте на предплечьях и пальцах ног, отрывая тело от земли.","Начните с того, что лягте на живот, подложив предплечья под себя. Держите локти прямо под плечами ладонями вниз. Напрягите пресс и туловище, чтобы приподняться на носки, не отрывая бедер и живота от пола. Сожмите ноги и ягодичные мышцы, чтобы держать тело на прямой линии."]
        ]'),
        
        
     ("ab", "Body saw", "assets/images/bodySaw.png", "assets/images/main/bodySawMain.png" , 20, "Easy | 390 Calories Burn", 
     '[
          ["Lower yourself into a low plank position.","Bend your elbows 90 degrees and place your forearms on the ground. Line up your forearms beneath your shoulders, with your head facing forward. Then, lift yourself onto your toes, keeping your back as straight as possible. Tighten your abs, shoulders, quads, glutes, and arms, so you’re completely firm and stable as you start the exercise. While you’re in this starting position, keep your head lined up with your hands."],
          ["Shift your entire body forward with your elbows and toes.","Bring the center of your body forward, shifting your weight from the balls of your feet to your tiptoes. Pull your nose past your hands to complete the first half of the rep. Tighten your abs as you shift yourself forward, and keep your back straight."],
          ["Bring the center of your body forward, shifting your weight from the balls of your feet to your tiptoes. Pull your nose past your hands to complete the first half of the rep. Tighten your abs as you shift yourself forward, and keep your back straight.","Guide the center of your body backward, shifting back to the balls of your feet. Move backward until your forehead is behind your hands. You’ve now completed 1 rep of the body saw exercise!"]
        ]');
        
        
     ("abru", "Пилка для тела", "assets/images/bodySaw.png", "assets/images/main/bodySawMain.png" , 20, "Легко | Сжигается 390 калорий", 
     '[
          ["Опуститесь в низкое положение на доске.","Согните руки в локтях на 90 градусов и положите предплечья на пол. Расположите предплечья под плечами так, чтобы голова была направлена вперед. Затем поднимитесь на носки, сохраняя спину как можно более прямой. Напрягите пресс, плечи, квадрицепсы, ягодичные мышцы и руки, чтобы в начале упражнения вы были полностью тверды и устойчивы. Находясь в этом исходном положении, держите голову на одной линии с руками."],
          ["Переместите все свое тело вперед, опираясь на локти и пальцы ног.","Перенесите центр своего тела вперед, перенеся вес с подушечек пальцев ног на цыпочки. Вытяните нос за руки, чтобы завершить первую половину повторения. Напрягите мышцы пресса, когда будете двигаться вперед, и держите спину прямой."],
          ["Переместите центр тяжести тела назад, чтобы завершить повторение.","Отведите центр своего тела назад, смещаясь к подушечкам стоп. Двигайтесь назад, пока ваш лоб не окажется за ладонями. Теперь вы выполнили 1 повторение упражнения "Пила для тела"!"]
        ]');
    ''');
          },
      );
    } catch (e) {
      print("Error opening database: $e");
    }
  }


  Future<void> addWorkoutData(String type, String name, String imgPath, String main_img_path ,int repetitions, String calories, String description) async {
    // Ensure that the database is already opened
    if (database == null) {
      throw Exception("Database is not open!");
    }

    try {
      // Insert data into the database
      await database.insert(
        _userTableName,
        {
          'type': type,
          'name': name,
          'img_path': imgPath,
          'main_img_path' : main_img_path,
          'repetitions': repetitions,
          'calories': calories,
          'description': description,
        },
      );
      print('Data added successfully');
    } catch (e) {
      print('Failed to add data: $e');
      // Handle error
    }
  }


  Future<void> updateData(int rep, int id) async {
    if (database == null) {
      throw Exception("Database is not open!");
    }

    await database.execute(
      '''
        UPDATE $_userTableName
        SET 'repetitions' = $rep
        WHERE id = $id;
      '''
    );
  }

  Future<void> updateWater(int amount, String date) async {
    if (database == null) {
      throw Exception("Database is not open!");
    }


    print(date);


    await database.execute(
        '''
        INSERT INTO $_waterTableName (count, time) VALUES ($amount, '${date.toString()}')
      '''
    );
  }



  Future<void> updateImage() async {
    if (database == null) {
      throw Exception("Database is not open!");
    }

    await database.execute(
        '''
        UPDATE $_userTableName
        SET 'main_img_path' = 'assets/images/main/oppositeArmMain.png'
        WHERE id = 22;
      '''
    );
  }



  Future<List<Map<String, dynamic>>> getListType(String type) async {
    List<Map<String, dynamic>> userMaps = await database.query(_userTableName);
    List<Map<String, dynamic>> filteredList = [];
    for (var userMap in userMaps) {
      if (userMap['type'] == type) {
        filteredList.add(userMap);
      }
    }
    return filteredList;
  }









  Future<List<Map<String, dynamic>>> getList() async {
    List<Map<String, dynamic>> userMaps = await database.query(_userTableName);
    return userMaps;
  }

  Future<List<Map<String, dynamic>>> getWaterList() async {
    List<Map<String, dynamic>> userMaps = await database.query(_waterTableName);
    return userMaps;
  }





}