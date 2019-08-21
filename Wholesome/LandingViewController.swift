//
//  LandingViewController.swift
//  Wholesome
//
//  Created by Daniel Nielsen on 21/08/2019.
//  Copyright © 2019 Wholesome Studios. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func createSlides() -> [Slide]{
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.slideIcon.image = UIImage(named: "IconWelcome")
        slide1.slideTitle.text = "Welcome"
        slide1.slideText.text = "You are among the first users of Wholesome studios app"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.slideIcon.image = UIImage(named: "IconBeta")
        slide2.slideTitle.text = "Prototype"
        slide2.slideText.text = "This is a prototype to give you an experience of the future product"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.slideIcon.image = UIImage(named: "IconSelf")
        slide3.slideTitle.text = "Self Care"
        slide3.slideText.text = "We help busy people take better care of themselves"
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.slideIcon.image = UIImage(named: "IconGuides")
        slide4.slideTitle.text = "Guides"
        slide4.slideText.text = "Find your favorite simple mind, body & food guide"
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.slideIcon.image = UIImage(named: "IconHouse")
        slide5.slideTitle.text = "Studios"
        slide5.slideText.text = "Meet your need in one of our many studios"
        
        let slide6:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide6.slideIcon.image = UIImage(named: "IconHouse")
        slide6.slideTitle.text = " "
        slide6.slideText.text = "Wholesome studios simple self care"
        
        return [slide1, slide2, slide3, slide4, slide5, slide6]
    }
    
    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.20) {
            slides[0].slideIcon.transform = CGAffineTransform(scaleX: (0.20-percentOffset.x)/0.20, y: (0.20-percentOffset.x)/0.20)
            slides[1].slideIcon.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.20 && percentOffset.x <= 0.40) {
            slides[1].slideIcon.transform = CGAffineTransform(scaleX: (0.40-percentOffset.x)/0.20, y: (0.40-percentOffset.x)/0.20)
            slides[2].slideIcon.transform = CGAffineTransform(scaleX: percentOffset.x/0.40, y: percentOffset.x/0.40)
            
        } else if(percentOffset.x > 0.40 && percentOffset.x <= 0.60) {
            slides[2].slideIcon.transform = CGAffineTransform(scaleX: (0.60-percentOffset.x)/0.20, y: (0.60-percentOffset.x)/0.20)
            slides[3].slideIcon.transform = CGAffineTransform(scaleX: percentOffset.x/0.60, y: percentOffset.x/0.60)
            
        } else if(percentOffset.x > 0.60 && percentOffset.x <= 0.80) {
            slides[3].slideIcon.transform = CGAffineTransform(scaleX: (0.80-percentOffset.x)/0.20, y: (0.80-percentOffset.x)/0.20)
            slides[4].slideIcon.transform = CGAffineTransform(scaleX: percentOffset.x/0.80, y: percentOffset.x/0.80)
        } else if(percentOffset.x > 0.80 && percentOffset.x <= 1) {
            slides[4].slideIcon.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.20, y: (1-percentOffset.x)/0.20)
            slides[5].slideIcon.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        /*
         *
         */
        setupSlideScrollView(slides: slides)
    }
}
