-- puppet.lua
-- Bouncer, a.k.a. Big Daddy

rootnode = gr.node('root')

steel = gr.material({0.54, 0.53, 0.51}, {0.5, 0.5, 0.5}, 20.0)
copper = gr.material({0.77, 0.66, 0.49}, {0.5, 0.5, 0.5}, 20.0)
aluminum = gr.material({0.72, 0.7, 0.62}, {0.5, 0.5, 0.5}, 20.0)
fabric = gr.material({0.39, 0.38, 0.22}, {0.1, 0.1, 0.1}, 10.0)
leather = gr.material({0.22, 0.15, 0.11}, {0.1, 0.1, 0.1}, 10.0)
eyecolour = gr.material({0.78, 0.95, 0.2}, {0.01, 0.01, 0.01}, 10.0)
red = gr.material({1.0, 0.0, 0.0}, {0.1, 0.1, 0.1}, 20.0)

rootnode = gr.node('root')
rootnode:rotate('y', -20.0)
rootnode:scale(0.25, 0.25, 0.25)
rootnode:translate(0.0, 0.0, -2.0)

-- The joint that controls neck position (out towards z axis)
neckholder = gr.node('neckholder')
rootnode:add_child(neckholder)
neckholder:rotate('x', 90)
neckholder:translate(0.0, 0.8, 0.6)
neckholder:scale(0.75, 0.75, 0.75)

neckjoint = gr.joint('neckjoint', {0, 0, 0}, {-90, 0, 90})
neckholder:add_child(neckjoint)

torso = gr.mesh('sphere', 'torso')
rootnode:add_child(torso)
torso:scale(1.0, 1.8, 1.3)
torso:set_material(copper)

torsobacktube = gr.mesh('ring', 'torsobacktube')
torso:add_child(torsobacktube)
torsobacktube:rotate('x', 90)
-- torsobacktube:rotate('y', 90)
torsobacktube:translate(0.0, 1.7, -0.1)
torsobacktube:scale(0.7, 0.4, 0.7)
torsobacktube:set_material(aluminum)

torsoright = gr.mesh('sphere', 'torsoright')
torso:add_child(torsoright)
torsoright:scale(0.6, 0.6, 0.6)
torsoright:rotate('z', 20);
torsoright:translate(-0.8, 0.3, -0.1)
torsoright:set_material(copper)

torsorighttube = gr.mesh('ring', 'torsorighttube')
torsoright:add_child(torsorighttube)
torsorighttube:rotate('z', 90)
torsorighttube:translate(0.0, 0.7, -0.1)
torsorighttube:scale(0.7, 0.7, 0.7)
torsorighttube:set_material(aluminum)

torsoleft = gr.mesh('sphere', 'torsoleft')
torso:add_child(torsoleft)
torsoleft:scale(0.6, 0.6, 0.6)
torsoleft:rotate('z', -20);
torsoleft:translate(0.8, 0.3, -0.1)
torsoleft:set_material(copper)

torsolefttube = gr.mesh('ring', 'torsolefttube')
torsoleft:add_child(torsolefttube)
torsolefttube:rotate('z', 90)
torsolefttube:translate(0.0, 0.7, -0.1)
torsolefttube:scale(0.7, 0.7, 0.7)
torsolefttube:set_material(aluminum)

torsoback = gr.mesh('sphere', 'torsoback')
torso:add_child(torsoback)
torsoback:translate(0.0, 0.2, -0.75)
torsoback:scale(0.75, 0.75, 0.75)
torsoback:set_material(copper)

head = gr.mesh('sphere', 'head')
neckjoint:add_child(head)
head:scale(1.0, 1.2, 1.0)
head:translate(0.0, 1.0, 0.0)
head:set_material(copper)

neck = gr.mesh('cylinder', 'neck')
neckjoint:add_child(neck)
neck:set_material(copper)

neckbrace = gr.mesh('cylinder', 'neckbrace')
neckjoint:add_child(neckbrace)
neckbrace:scale(1.1, 0.1, 1.1)
neckbrace:translate(0.0, 1.1, 0.0)
neckbrace:set_material(copper)

upperfaceguard = gr.mesh('ring', 'upperfaceguard')
rootnode:add_child(upperfaceguard)
upperfaceguard:rotate('x', -55.0)
upperfaceguard:translate(0.0, 1.0, 1.8)
upperfaceguard:scale(0.8, 0.8, 0.8)
upperfaceguard:set_material(aluminum)

middlefaceguard = gr.mesh('ring', 'middlefaceguard')
rootnode:add_child(middlefaceguard)
middlefaceguard:rotate('x', -25.0)
middlefaceguard:translate(0.0, 0.8, 1.9)
middlefaceguard:scale(0.8, 0.8, 0.8)
middlefaceguard:set_material(aluminum)

lowerfaceguard = gr.mesh('ring', 'lowerfaceguard')
rootnode:add_child(lowerfaceguard)
lowerfaceguard:rotate('x', 30.0)
lowerfaceguard:translate(0.0, 0.6, 1.9)
lowerfaceguard:scale(0.8, 0.8, 0.8)
lowerfaceguard:set_material(aluminum)

mainfaceguard = gr.mesh('ring', 'mainfaceguard')
rootnode:add_child(mainfaceguard)
mainfaceguard:rotate('z', 90.0)
mainfaceguard:translate(0.0, 0.4, 0.3)
mainfaceguard:scale(1.0, 1.4, 1.7)
mainfaceguard:set_material(aluminum)

-- Back-mounted air tank
tank = gr.node('tank')
rootnode:add_child(tank)
tank:rotate('x', 30)
tank:rotate('z', -20)
tank:translate(0.8, 1.0, -2.2)
tank:scale(0.9, 0.9, 0.9)

tankcylinder = gr.mesh('cylinder', 'tankcylinder')
tank:add_child(tankcylinder)
tankcylinder:scale(0.7, 1.2, 0.7)
tankcylinder:set_material(aluminum)

tanktop = gr.mesh('sphere', 'tanktop')
tankcylinder:add_child(tanktop)
tanktop:scale(1.0, 0.3, 1.0)
tanktop:translate(0.0, 1.0, 0.0)
tanktop:set_material(aluminum)

tankbottom = gr.mesh('sphere', 'tankbottom')
tankcylinder:add_child(tankbottom)
tankbottom:scale(1.0, 0.3, 1.0)
tankbottom:translate(0.0, -1.0, 0.0)
tankbottom:set_material(aluminum)

tankaxeljoint = gr.joint('tankaxeljoint', {0, 0, 0}, {-180, 0, 180})
tank:add_child(tankaxeljoint)
tankaxeljoint:translate(0.0, 2.0, 0.0)

tankaxel = gr.mesh('sphere', 'tankaxel')
tankaxeljoint:add_child(tankaxel)
tankaxel:scale(0.1, 0.1, 0.1)
tankaxel:set_material(steel)

tankcrank = gr.mesh('ring', 'tankcrank')
tankaxeljoint:add_child(tankcrank)
tankcrank:scale(0.5, 0.75, 0.5)
tankcrank:set_material(red)

tankshaftbase = gr.mesh('sphere', 'tankshaftbase')
tankcylinder:add_child(tankshaftbase)
tankshaftbase:scale(0.4, 0.2, 0.4)
tankshaftbase:translate(0.0, 1.2, 0.0)
tankshaftbase:set_material(steel)

tankshaft = gr.mesh('sphere', 'tankshaft')
tankcylinder:add_child(tankshaft)
tankshaft:scale(0.1, 0.5, 0.1)
tankshaft:translate(0.0, 1.2, 0.0)
tankshaft:set_material(steel)

tankring1 = gr.mesh('cylinder', 'tankring1')
tankcylinder:add_child(tankring1)
tankring1:scale(1.1, 0.08, 1.1)
tankring1:translate(0.0, 0.9, 0.0)
tankring1:set_material(steel)

tankring2 = gr.mesh('cylinder', 'tankring2')
tankcylinder:add_child(tankring2)
tankring2:scale(1.15, 0.03, 1.15)
tankring2:translate(0.0, 0.6, 0.0)
tankring2:set_material(steel)

tankring3 = gr.mesh('cylinder', 'tankring3')
tankcylinder:add_child(tankring3)
tankring3:scale(1.15, 0.03, 1.15)
tankring3:translate(0.0, 0.2, 0.0)
tankring3:set_material(steel)

tankring4 = gr.mesh('cylinder', 'tankring4')
tankcylinder:add_child(tankring4)
tankring4:scale(1.15, 0.03, 1.15)
tankring4:translate(0.0, 0.0, 0.0)
tankring4:set_material(steel)

tankcranksupport1 = gr.mesh('sphere', 'tankcranksupport1')
tankaxeljoint:add_child(tankcranksupport1)
tankcranksupport1:scale(0.5, 0.03, 0.03)
tankcranksupport1:set_material(aluminum)

tankcranksupport2 = gr.mesh('sphere', 'tankcranksupport2')
tankaxeljoint:add_child(tankcranksupport2)
tankcranksupport2:scale(0.03, 0.03, 0.5)
tankcranksupport2:set_material(aluminum)

-- The motor, the second device on Big Daddy's back
motor = gr.node('motor')
rootnode:add_child(motor)
motor:rotate('z', 10)
motor:rotate('x', 20)
motor:translate(-0.8, 0.8, -1.5)
-- motor:scale(0.9, 0.9, 0.9)

motorshaft = gr.mesh('cylinder', 'motorshaft')
motor:add_child(motorshaft)
motorshaft:scale(0.2, 1.0, 0.2)
motorshaft:set_material(steel)

motorbase = gr.mesh('sphere', 'motorbase')
motorshaft:add_child(motorbase)
motorbase:scale(1.75, 0.15, 1.75)
motorbase:translate(0.0, -1.0, 0.0)
motorbase:set_material(steel)

motortop = gr.mesh('sphere', 'motortop')
motorshaft:add_child(motortop)
motortop:scale(1.75, 0.15, 1.75)
motortop:translate(0.0, 1.0, 0.0)
motortop:set_material(steel)

motortube = gr.mesh('cylinder', 'motortube')
motorshaft:add_child(motortube)
motortube:scale(0.7, 0.4, 0.7)
motortube:translate(0.0, 1.5, 0.0)
motortube:set_material(steel)

motortubetop = gr.mesh('cylinder', 'motortubetop')
motortube:add_child(motortubetop)
motortubetop:scale(1.3, 0.4, 1.3)
motortubetop:translate(0.0, 1.0, 0.0)
motortubetop:set_material(aluminum)

for i = 1, 4 do
    -- Always either x or z transform, positive for negative
    tx = ((i > 2 and 0) or 1.5) * ((i % 2 == 0 and -1) or 1)
    tz = ((i > 2 and 1.5) or 0) * ((i % 2 == 0 and 1) or -1)

    local motorshaftsupport = gr.mesh('sphere', 'motorshaftsupport' .. i)
    motorshaft:add_child(motorshaftsupport)
    motorshaftsupport:scale(0.2, 1.0, 0.2)
    motorshaftsupport:translate(tx, 0.0, tz)
    motorshaftsupport:set_material(steel)
end


-- Eyes
function make_eye(type)
    local eye = gr.node(type .. 'eye')
    eye:scale(0.17, 0.17, 0.17)

    local eyesphere = gr.mesh('sphere', type .. 'eyesphere')
    eye:add_child(eyesphere)
    eye:scale(1.0, 0.6, 1.0)
    eyesphere:set_material(eyecolour)

    local eyering = gr.mesh('cylinder', type .. 'eyering')
    eye:add_child(eyering)
    eyering:scale(1.3, 0.3, 1.3)
    eyering:set_material(copper)

    return eye
end

righteye = make_eye('right')
head:add_child(righteye)
righteye:translate(0.0, 1.0, 0.0)
righteye:rotate('z', 15.0)

lefteye = make_eye('left')
head:add_child(lefteye)
lefteye:translate(0.0, 1.0, 0.0)
lefteye:rotate('z', -15.0)

upperrighteye = make_eye('upperright')
head:add_child(upperrighteye)
upperrighteye:translate(0.0, 1.0, 0.0)
upperrighteye:rotate('x', -30.0)
upperrighteye:rotate('z', 17.0)

upperlefteye = make_eye('upperleft')
head:add_child(upperlefteye)
upperlefteye:translate(0.0, 1.0, 0.0)
upperlefteye:rotate('x', -30.0)
upperlefteye:rotate('z', -17.0)

lowerrighteye = make_eye('lowerright')
head:add_child(lowerrighteye)
lowerrighteye:translate(0.0, 1.0, 0.0)
lowerrighteye:rotate('x', 30.0)
lowerrighteye:rotate('z', 17.0)

lowerlefteye = make_eye('lowerleft')
head:add_child(lowerlefteye)
lowerlefteye:translate(0.0, 1.0, 0.0)
lowerlefteye:rotate('x', 30.0)
lowerlefteye:rotate('z', -17.0)

farrighteye = make_eye('farright')
head:add_child(farrighteye)
farrighteye:translate(0.0, 1.0, 0.0)
farrighteye:rotate('z', 44.0)

farlefteye = make_eye('farleft')
head:add_child(farlefteye)
farlefteye:translate(0.0, 1.0, 0.0)
farlefteye:rotate('z', -44.0)

-- Legs
function make_leg(type, side)

    hipjoint = gr.joint(type .. 'hipjoint', {-45, 20, 30}, {0, 0, 0})

    thigh = gr.mesh('sphere', type .. 'thigh')
    hipjoint:add_child(thigh)
    thigh:scale(0.9, 1.5, 0.9)
    thigh:translate(0.0, -1.5, 0.0)
    thigh:set_material(fabric)

    legring = gr.mesh('cylinder', type .. 'legring')
    hipjoint:add_child(legring)
    legring:scale(1.1, 0.15, 1.1)
    legring:rotate('z', side * -25)
    legring:translate(side * -0.2, -2.0, 0.0)
    legring:set_material(copper)

    kneecap = gr.mesh('sphere', type .. 'kneecap')
    hipjoint:add_child(kneecap)
    kneecap:scale(0.4, 0.4, 0.4)
    kneecap:rotate('x', 20)
    kneecap:translate(0.0, -3.3, 0.4)
    kneecap:set_material(copper)

    kneeguard = gr.mesh('cylinder', type .. 'kneeguard')
    hipjoint:add_child(kneeguard)
    kneeguard:scale(0.6, 0.20, 0.6)
    kneeguard:rotate('x', 20)
    kneeguard:translate(0.0, -3.1, -0.2)
    kneeguard:set_material(copper)

    kneejoint = gr.joint(type .. 'kneejoint', {0, 0, 45}, {0, 0, 0})
    hipjoint:add_child(kneejoint)
    kneejoint:scale(0.66, 0.66, 0.66)
    kneejoint:rotate('x', 20)
    kneejoint:translate(0.0, -3.0, 0.0)

    shin = gr.mesh('sphere', type .. 'shin')
    kneejoint:add_child(shin)
    shin:scale(1.0, 1.5, 1.0)
    shin:translate(0.0, -1.7, 0.0)
    shin:set_material(fabric)

    anklet = gr.mesh('cylinder', type .. 'anklet')
    kneejoint:add_child(anklet)
    anklet:scale(1.0, 0.2, 1.0)
    anklet:translate(0.0, -2.8, 0.0)
    anklet:set_material(leather)

    anklejoint = gr.joint(type .. 'anklejoint', {-45, -45, 45}, {0, 0, 0})
    kneejoint:add_child(anklejoint)
    anklejoint:rotate('x', -105.0)
    anklejoint:scale(0.9, 0.9, 0.9)
    anklejoint:translate(0.0, -3.5, 0)

    heel = gr.mesh('sphere', type .. 'heel')
    anklejoint:add_child(heel)
    heel:set_material(steel)

    foot = gr.mesh('cylinder', type .. 'foot')
    anklejoint:add_child(foot)
    foot:translate(0.0, -1.2, -0.3)
    foot:scale(1.0, 1.0, 0.7)
    foot:set_material(leather)

    toes = gr.mesh('sphere', type .. 'toes')
    foot:add_child(toes)
    toes:translate(0.0, -1.0, 0.2)
    toes:scale(1.2, 1.2, 1.2)
    toes:set_material(steel)

    sole1 = gr.mesh('cylinder', type .. 'sole1')
    foot:add_child(sole1)
    sole1:rotate('x', 90)
    sole1:translate(0.0, 0.0, -1.5)
    sole1:scale(1.4, 2.5, 0.4)
    sole1:set_material(steel)

    return hipjoint
end

rightleg = make_leg('right', 1)
rootnode:add_child(rightleg)
rightleg:scale(0.5, 0.5, 0.5)
rightleg:rotate('y', -15)
rightleg:translate(-0.8, -0.6, 0.0)

leftleg = make_leg('left', -1)
rootnode:add_child(leftleg)
leftleg:scale(0.5, 0.5, 0.5)
leftleg:rotate('y', 15)
leftleg:translate(0.8, -0.6, 0.0)

-- leftleg = make_leg('right', -1)

function make_arm(type, wristjoint)
    local shoulderjoint = gr.joint(type .. 'shoulderjoint', {0.0, 45.0, 90.0}, {0.0, 0.0, 0.0})

    local shoulder = gr.mesh('sphere', type .. 'shoulder')
    shoulderjoint:add_child(shoulder)
    shoulder:scale(0.8, 0.8, 0.8)
    shoulder:set_material(fabric)

    local upperarm = gr.mesh('sphere', type .. 'upperarm')
    shoulderjoint:add_child(upperarm)
    upperarm:translate(0.0, 1.0, 0.0)
    upperarm:scale(0.7, 1.5, 0.7)
    upperarm:set_material(fabric)

    local upperarmring1 = gr.mesh('cylinder', type .. 'upperarmring1')
    upperarm:add_child(upperarmring1)
    upperarmring1:scale(1.1, 0.2, 1.1)
    upperarmring1:translate(0.0, -0.3, 0.0)
    upperarmring1:set_material(copper)

    local upperarmring2 = gr.mesh('cylinder', type .. 'upperarmring2')
    upperarm:add_child(upperarmring2)
    upperarmring2:scale(1.25, 0.05, 1.25)
    upperarmring2:translate(0.0, -0.5, 0.0)
    upperarmring2:set_material(copper)

    local upperarmring3 = gr.mesh('cylinder', type .. 'upperarmring3')
    upperarm:add_child(upperarmring3)
    upperarmring3:scale(1.25, 0.05, 1.25)
    upperarmring3:translate(0.0, -0.1, 0.0)
    upperarmring3:set_material(copper)

    local elbow = gr.joint(type .. 'elbowjoint', {0.0, 0.0, 90.0}, {0.0, 0.0, 0.0})
    shoulderjoint:add_child(elbow)
    elbow:translate(0.0, 3.0, -0.2)

    local forearm = gr.mesh('sphere', type .. 'forearm')
    elbow:add_child(forearm)
    forearm:translate(0.0, 0.5, 0.0)
    forearm:scale(0.65, 1.2, 0.8)
    forearm:set_material(fabric)

    local wristring = gr.mesh('cylinder', type .. 'wristring')
    elbow:add_child(wristring)
    wristring:scale(0.5, 0.1, 0.5)
    wristring:translate(0.0, 1.7, 0.0)
    wristring:set_material(copper)

    elbow:add_child(wristjoint)

    return shoulderjoint
end

rightwristjoint = gr.joint('rightwristjoint', {0.0, 0.0, 0.0}, {-180.0, 0.0, 180.0})
rightwristjoint:translate(0.0, 1.8, 0.0)

leftwristjoint = gr.joint('leftwristjoint', {-70.0, 0.0, 70.0}, {0.0, 0.0, 0.0})
leftwristjoint:scale(0.6, 0.6, 0.6)
leftwristjoint:rotate('y', 90)
leftwristjoint:translate(0.0, 1.8, 0.0)

-- Hand-related objects
rightarm = make_arm('right', rightwristjoint)
rootnode:add_child(rightarm)
-- rightarm:rotate('y', -30)
rightarm:rotate('z', 135)
rightarm:translate(-2.8, 1.6, 0.0)
rightarm:scale(0.5, 0.5, 0.5)

lefttarm = make_arm('left', leftwristjoint)
rootnode:add_child(lefttarm)
lefttarm:rotate('z', -135)
lefttarm:translate(2.8, 1.6, 0.0)
lefttarm:scale(0.5, 0.5, 0.5)

palm1 = gr.mesh('sphere', 'palm1')
leftwristjoint:add_child(palm1)
palm1:scale(0.6, 1.0, 0.65)
palm1:translate(0.2, 0.6, 0.0)
palm1:set_material(leather)

palm2 = gr.mesh('sphere', 'palm2')
leftwristjoint:add_child(palm2)
palm2:scale(0.8, 1.0, 0.65)
palm2:rotate('z', 30.0)
palm2:translate(-0.4, 0.6, 0.0)
palm2:set_material(leather)

palm3 = gr.mesh('sphere', 'palm3')
leftwristjoint:add_child(palm3)
palm3:scale(1.0, 0.7, 0.65)
palm3:translate(-0.2, 1.2, 0.0)
palm3:set_material(leather)

thumb = gr.mesh('sphere', 'thumb')
leftwristjoint:add_child(thumb)
thumb:scale(0.35, 1.3, 0.35)
thumb:rotate('z', 50.0)
thumb:rotate('x', 45.0)
thumb:translate(-1.2, 0.5, 0.3)
thumb:set_material(leather)

function make_finger(type)
    local fingerbottomjoint = gr.joint(type .. 'fingerbottomjoint', {0, 0, 45}, {0, 0, 0})

    local fingerbottom = gr.mesh('sphere', type .. 'fingerbottom')
    fingerbottomjoint:add_child(fingerbottom)
    fingerbottom:set_material(leather)

    local fingercentrejoint = gr.joint(type .. 'fingercentrejoint', {0, 0, 45}, {0, 0, 0})
    fingerbottomjoint:add_child(fingercentrejoint)
    fingercentrejoint:rotate('x', 45.0)
    fingercentrejoint:translate(0.0, 3.0, 0.0)

    local lowerfinger = gr.mesh('cylinder', type .. 'lowerfinger')
    fingerbottomjoint:add_child(lowerfinger)
    lowerfinger:scale(1.0, 1.5, 1.0)
    lowerfinger:translate(0.0, 1.5, 0.0)
    lowerfinger:set_material(leather)

    local fingercentre = gr.mesh('sphere', type .. 'fingercentre')
    fingercentrejoint:add_child(fingercentre)
    fingercentre:set_material(leather)

    local upperfinger = gr.mesh('cylinder', type .. 'upperfinger')
    fingercentrejoint:add_child(upperfinger)
    upperfinger:scale(1.0, 1.5, 1.0)
    upperfinger:translate(0.0, 1.5, 0.0)
    upperfinger:set_material(leather)

    local fingertip = gr.mesh('sphere', type .. 'fingertip')
    fingercentrejoint:add_child(fingertip)
    fingertip:translate(0.0, 3.0, 0.0)
    fingertip:set_material(leather)

    return fingerbottomjoint
end

indexfinger = make_finger('index')
leftwristjoint:add_child(indexfinger)
indexfinger:scale(0.3, 0.3, 0.4)
indexfinger:rotate('z', 15)
indexfinger:translate(-0.7, 1.3, -0.1)

middlefinger = make_finger('middle')
leftwristjoint:add_child(middlefinger)
middlefinger:scale(0.32, 0.32, 0.42)
middlefinger:rotate('z', 5)
middlefinger:translate(-0.1, 1.4, -0.1)

fourthfinger = make_finger('fourth')
leftwristjoint:add_child(fourthfinger)
fourthfinger:scale(0.28, 0.28, 0.38)
fourthfinger:rotate('z', -10)
fourthfinger:translate(0.5, 1.3, -0.1)

-- Support objects around the drill

drillsupport_primary = gr.mesh('ring', 'drillsupport_primary')
rightwristjoint:add_child(drillsupport_primary)
drillsupport_primary:scale(1.2, 1.0, 1.2)
drillsupport_primary:set_material(steel)

drillsupport_secondary = gr.mesh('ring', 'drillsupport_secondary')
rightwristjoint:add_child(drillsupport_secondary)
drillsupport_secondary:scale(1.2, 1.0, 1.2)
drillsupport_secondary:translate(0.0, 0.3, 0.0)
drillsupport_secondary:set_material(steel)

drillsupport = {}
for i = 1, 4 do
    drillsupport[i] = gr.mesh('sphere', 'drillsupport' .. i)
    rightwristjoint:add_child(drillsupport[i])
    drillsupport[i]:set_material(steel)
    drillsupport[i]:scale(0.08, 0.37, 0.08)
end
drillsupport[1]:translate(1.25, -0.05, 0.0)
drillsupport[2]:translate(-1.25, -0.05, 0.0)
drillsupport[3]:translate(0.0, -0.05, 1.25)
drillsupport[4]:translate(0.0, -0.05, -1.25)

drillsupport_base1  = gr.mesh('sphere', 'drillsupport_base1')
rightwristjoint:add_child(drillsupport_base1)
drillsupport_base1:scale(0.16, 0.16, 1.3)
drillsupport_base1:translate(0.0, -0.37, 0.0)
drillsupport_base1:set_material(steel)

drillsupport_base2  = gr.mesh('sphere', 'drillsupport_base2')
rightwristjoint:add_child(drillsupport_base2)
drillsupport_base2:scale(1.3, 0.16, 0.16)
drillsupport_base2:translate(0.0, -0.37, 0.0)
drillsupport_base2:set_material(steel)

drill = gr.mesh('cone', 'drill')
rightwristjoint:add_child(drill)
drill:set_material(steel)
drill:scale(1.0, 1.7, 1.0)

drillbase = gr.mesh('sphere', 'drillbase')
drill:add_child(drillbase)
drillbase:scale(1.0, 0.4, 1.0)
drillbase:set_material(steel)

drillbase2 = gr.mesh('sphere', 'drillbase2')
drill:add_child(drillbase2)
drillbase2:scale(1.0, 0.4, 1.0)
drillbase2:translate(0.0, -0.1, 0.0)
drillbase2:set_material(steel)

drings = {}
for i=1, 5 do
    local scaling = 1.3 - (i * 0.2)
    drings[i] = gr.mesh('cylinder', 'dring'..i)
    drill:add_child(drings[i])
    drings[i]:scale(scaling, 0.03, scaling)
    drings[i]:rotate('z', 10)
    drings[i]:translate(0.0, (i * 0.32) + 0.1, 0.0)
    drings[i]:set_material(steel)
end

return rootnode
