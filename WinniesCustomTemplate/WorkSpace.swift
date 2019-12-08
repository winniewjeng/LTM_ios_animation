//
//  WorkSpace.swift
//  Art61_BasicTemplate
//
//  Created by MASOOD KAMANDY on 4/30/18.
//  Copyright © 2018 Masood Kamandy. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import C4

class WorkSpace: CanvasController {
    
    // set up audio player outside the scope of a method
    var ap = AudioPlayer("Media/Earth_intro.mp3")
    var delay = 0.0
    var moonAnimation = 0
    
    override func setup() {
        
        var timer1 = Timer(interval:2, count:1, action: frame1)
        var timer2 = C4.Timer(interval:2, count:1, action: frame2)
        var timer3 = C4.Timer(interval:2, count:1, action: frame3)
        earth()
        
        timer1.start()
        timer2.start()
        timer3.start()
        
        
        
    }
    
    func clear() {
        // clean up the canvas with each refresh
        self.canvas.view.layer.sublayers = nil
    }
    
    func earth() {
        var earth = Image("Media/Earth_walk_no_cross.png") // 172x182
        earth?.frame = Rect(0, canvas.height*0.4, earth!.width, earth!.height)
        canvas.add(earth)
    }
    
    func earthBlink() {
        self.canvas.view.layer.sublayers = nil
        var earth = Image("Media/Earth_blink.png")
        earth?.frame = Rect(0, self.canvas.height*0.4, earth!.width, earth!.height)
        canvas.add(earth)
    }
    
    func earthWalkCross(framePos: Double) {
        self.canvas.view.layer.sublayers = nil
        var earth = Image("Media/Earth_walk_cross.png")
        earth?.frame = Rect(self.canvas.width*(framePos/8), self.canvas.height*0.4, earth!.width, earth!.height)
        canvas.add(earth)
    }
    
    func earthWalkNoCross(framePos: Double) {
        self.canvas.view.layer.sublayers = nil
        var earth = Image("Media/Earth_walk_no_cross.png")
        earth?.frame = Rect(self.canvas.width*(framePos/8), self.canvas.height*0.4, earth!.width, earth!.height)
        canvas.add(earth)
    }
    
    func earthNoSpeak() -> Image {
        self.canvas.view.layer.sublayers = nil
        var earth = Image("Media/Earth_no_speak.png")
        earth?.frame = Rect(self.canvas.width*(5.0/8), self.canvas.height*0.4, earth!.width, earth!.height)
        canvas.add(earth)
        return earth!
    }
    
    func earthNoMouth() -> Image {
        self.canvas.view.layer.sublayers = nil
        var earth = Image("Media/Earth_no_mouth.png")
        earth?.frame = Rect(self.canvas.width*(5.0/8), self.canvas.height*0.4, earth!.width, earth!.height)
        canvas.add(earth)
        return earth!
    }
    
    func yesButton(on: Bool) -> Image{
        var yes = Image("Media/yes.png")
        yes?.transform = Transform.makeScale(0.2, 0.2)
        yes?.frame = Rect(self.canvas.width*0.6, self.canvas.height*0.1,yes!.width,yes!.height)
        // print(yes!.width," ", yes!.height)
        if (on) {
            canvas.add(yes)
        } else {
            print("here!")
            yes?.removeFromSuperview()
        }
        return yes!
    }
    
    func moonSlide() -> Image {
        var moon = Image("Media/moon_slide.png")
        moon?.frame = Rect(self.canvas.width*(1.0/8), self.canvas.height*0.55, moon!.width, moon!.height)
        canvas.add(moon)
        return moon!
    }
    
    func moonNoMouth() {
        var moon = Image("Media/moon_no_mouth.png")
        moon?.frame = Rect(self.canvas.width*(1.0/8), self.canvas.height*0.55, moon!.width, moon!.height)
        canvas.add(moon)
    }
    
    func frame1() {
        print("delay ", delay, " at start of frame one")
        // initializing animation condition
        self.clear()
        self.canvas.backgroundColor = C4Grey
        var sceneEnds = false
        DispatchQueue.main.async() {
            self.clear()
            self.earthBlink()
        }
        delay+=0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.clear()
            self.earth()
        }
        delay+=0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.clear()
            self.earthBlink()
        }
        delay+=0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.clear()
            self.earth()
        }
        delay+=0.25
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.clear()
            self.earthBlink()
        }
        delay+=0.25
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.clear()
            self.earth()
        }
        print("delay ", delay, " after frame one")
    }
    
    func frame2() {
        // initializing animation condition
        print("delay ", delay, " at start of frame two")
        self.clear()
        canvas.backgroundColor = C4Grey
        var EarthFramePosX = 0.0
        delay = 2.0 // hard-set the delay value to after frame 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkNoCross(framePos:EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkNoCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkNoCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkNoCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5
            self.clear()
            self.earthWalkCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            EarthFramePosX += 0.5 // ends at 5.0
            self.clear()
            self.earthWalkNoCross(framePos: EarthFramePosX)
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.clear()
            self.earthNoSpeak()
        }
        delay+=0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.clear()
            self.earthNoMouth()
        }
        print("delay ", delay, " after frame two")
    }
    
    func playAudio(audioClip: String) {
        // audio
        print("inside audio, playing ", audioClip)
        ap = AudioPlayer(audioClip)
        self.ap?.volume = 1.0
        self.ap?.loops = false
        self.ap?.play()
        if (ap?.playing==false) {
            print("audio failure")
        } else {
            print(audioClip, " duration ", ap?.duration)
        }
    }
    
    func earthSpeaks(audioClip: String, duration: Double) {
        // mouth shape
        var mouthCenter_earth = Point(self.canvas.width*(5.7/8), self.canvas.height*0.6)
        var mouth = Circle(center: mouthCenter_earth, radius: 10)
        mouth.fillColor = black
        self.canvas.add(mouth)
        
        // audio
        playAudio(audioClip: audioClip)
        
        // voiceover of mouth animation
        let a = ViewAnimation(duration:duration/5.0) {
            mouth.transform = Transform.makeScale(0.1, 0.1)
        }
        a.repeatCount = duration - 1
        a.autoreverses = true
        a.animate()
    }
    
    func moonSpeaks(audioClip: String, duration: Double) {
        // mouth shape
        var mouthCenter_moon = Point(self.canvas.width*(1.75/8), self.canvas.height*0.68)
        var mouth = Circle(center: mouthCenter_moon, radius: 5)
        mouth.fillColor = black
        self.canvas.add(mouth)
        
        playAudio(audioClip: audioClip)
        
        // voiceover of mouth animation
        let a = ViewAnimation(duration:1.0) {
            mouth.transform = Transform.makeScale(0.1, 0.1)
        }
        a.repeatCount = duration
        a.autoreverses = true
        a.animate()
        
    }
    
    // prompting for user's tap gesture
    func frame3() {
        // initializing animation condition
        self.clear()
        canvas.backgroundColor = C4Grey
        
        delay = 4.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.earthSpeaks(audioClip: "Media/Earth_intro.mp3", duration: 5.04)
        }
        
        delay+=5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            var on = true
            var yes = self.yesButton(on:on)
            let rectangle = Rectangle(frame:Rect(self.canvas.width*0.6, self.canvas.height*0.1, 200, 105))
            rectangle.fillColor = nil
            rectangle.strokeColor = nil
            
            // while no clicking, animation on the button
            let a = ViewAnimation(duration:1.0) {
                yes.transform = Transform.makeScale(0.1, 0.1)
            }
            a.repeats = true
            a.autoreverses = true
            a.animate()
            
            // enable clicking action
            self.canvas.addTapGestureRecognizer {
                locations, center, state in
                
                self.moonAnimation += 1 //   self.moonAnimation += 1
                print(self.delay)
                if (self.moonAnimation == 1) {
                    // if user clicks, remove yesButton and start animation of moon
                    self.yesButton(on:false)
                    yes.removeFromSuperview()
                    // start moon animation
                    self.frame4()
                }
            }
        }
        print("delay ", delay, " after frame three")
    }
    
    // moon appears
    func frame4() {
        
        print("frame4 starts")
        var newDelay = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.moonSlide()
            
        }
        newDelay+=1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.earthNoMouth()
            self.moonNoMouth()
        }
        //        newDelay+=0.25
        //        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
        self.frame5()
        //        }
    }
    
    // conversation
    func frame5() {
        print("frame5 starts")
        var newDelay = 0.0
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.earthSpeaks(audioClip: "Media/HowRU.mp3", duration: 2)
        }
        newDelay+=2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.moonSpeaks(audioClip: "Media/NotMuch.mp3", duration: 4)
        }
        newDelay+=4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.moonSpeaks(audioClip: "Media/sowhat.mp3", duration: 2)
        }
        newDelay+=2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.earthSpeaks(audioClip: "Media/intro_team.mp3", duration:8.5)
        }
        newDelay+=8.5
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.moonSpeaks(audioClip: "Media/sowhat.mp3", duration: 2)
            print(2)
        }
        newDelay+=2
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.earthSpeaks(audioClip: "Media/perm_shadowed.mp3", duration: 12)
        }
        newDelay+=12
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.moonSpeaks(audioClip: "Media/sowhat.mp3", duration: 2)
            print(3)
        }
        newDelay+=2
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.earthSpeaks(audioClip: "Media/reservoir.mp3", duration: 7)
        }
        newDelay+=7
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.moonSpeaks(audioClip: "Media/sowhat.mp3", duration: 2)
            print(4)
        }
        newDelay+=2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.earthSpeaks(audioClip: "Media/rocket_fuels.mp3", duration: 19)
        }
        newDelay+=19
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.moonSpeaks(audioClip: "Media/sowhat.mp3", duration: 1)
            print(5)
        }
        newDelay+=1
        DispatchQueue.main.asyncAfter(deadline: .now() + newDelay) {
            self.earthSpeaks(audioClip: "Media/excited.mp3", duration: 2.6)
        }
        
        
    }
    
}



