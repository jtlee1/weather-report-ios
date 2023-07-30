//
//  PageViewController.swift
//  HW9
//
//  Created by Justin Lee on 12/5/21.
//

import UIKit

protocol PageProtocol: class{
    func deletepage()
    func createpage(name:String)
    func pushpage(name:String)
    func createtab()
}

class PageViewController: UIPageViewController,  UIPageViewControllerDataSource, UIPageViewControllerDelegate, PageProtocol{
    
    
    
    
    
    weak var navProtocol: NavProtocol?
    var pages = [UIViewController]()
    var pflag = 0
    
    let p0 = ThirdViewController()
    var p1 = ForthViewController()
    var p2 = EighthViewController()
    var p3 = FifthViewController()
    let p4 = ThirdViewController()

    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            var backB = UIBarButtonItem()
            backB.title = "Page"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backB
            
            self.delegate = self
            self.dataSource = self
            
            //self.transitionStyle = .scroll
            p2.pageProtocol = self
            p0.pageProtocol = self
            /*let p1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "id1")
            let p2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "id2")
            let p3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "id3")*/

            // etc ...

            pages.append(p0)
            //pages.append(p4)
            //pages.append(p1)

            // etc ...

            setViewControllers([p0], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViewControllers([p0], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }
    
    func pushpage(name: String) {
        print("inPAGEVC")
        //self.navProtocol?.createpage(name: name)
        let p = ThirdViewController()
        print("createPage")
        p.name = name
        p.pageProtocol = self
        p.ispress = 1
        self.navigationController!.pushViewController(p, animated: true)
    }
    
    func deletepage() {
        pages.remove(at:pflag)
        pflag = 0
        self.setViewControllers([p0], direction: .forward, animated: true, completion: nil)

        //print("delete")
    }
    func createpage(name:String) {
        let p = ThirdViewController()
        print("createPage")
        p.pageProtocol = self
        p.name = name
        p.ispage = 1
        pages.append(p)
    }
    
    func createtab() {
        let p = SixthViewController()
        self.navigationController!.pushViewController(p, animated: true)
    }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)-> UIViewController? {
           
            let cur = pages.firstIndex(of: viewController)!

            // if you prefer to NOT scroll circularly, simply add here:
            if cur == 0 { return nil }
            if pflag > 0{
                pflag -= 1
            }
            var prev = (cur - 1) % pages.count
            if prev < 0 {
                prev = pages.count - 1
            }
            return pages[prev]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)-> UIViewController? {
             
            let cur = pages.firstIndex(of: viewController)!

            // if you prefer to NOT scroll circularly, simply add here:
            if cur == (pages.count - 1) { return nil }
            if pflag < 2{
                pflag += 1
            }
            let nxt = abs((cur + 1) % pages.count)
            return pages[nxt]
        }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        print("CALL1")
        return pages.count
    }
    /*func presentationIndex(for pageViewController: UIPageViewController)-> Int {
            return 0
    }*/
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
            guard let index = viewControllers?.index(of: (pageViewController.viewControllers?.first)!) else { return 0 }
            print("CALL2")
            return index
    }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
