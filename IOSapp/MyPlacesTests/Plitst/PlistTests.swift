//
//  PlistTests.swift
//  MyPlacesTests
//
//  Created by SERGEI KOSAREV on 7/14/22.


import XCTest
@testable import MyPlaces

class PlistTests: XCTestCase {
    override func setUpWithError() throws {
        <#code#>
    }
    override func tearDownWithError() throws {
        <#code#>
    }
    func testTableViewNotNillWhenViewIsLoaded() {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: MainViewController.self))
        let sut = vc as! MainViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }
}
