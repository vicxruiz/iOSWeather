//
//  WeatherListViewModelTests.swift
//  WeatherAppTests
//
//  Created by Victor Ruiz on 6/6/23.
//

import Foundation
import XCTest
@testable import WeatherApp

final class WeatherListViewModelTests: XCTestCase {
    var viewModel: WeatherListViewModel!
    
    // MARK: - Outputs
    
    var viewState: [ViewState] = []
    var didTapCell: [Bool] = []
    var cellTypes: [[WeatherListSectionCellConfig]] = []
    
    let weather = WeatherResponse(
        weather: [Weather(id: 1, main: "test", description: "test", icon: "test")],
        main: Main(temp: 10, feelsLike: 10, tempMin: 10, tempMax: 10, pressure: 10, humidity: 10),
        wind: Wind(speed: 2, deg: 10),
        id: 1,
        name: "test"
    )
    
    // MARK: - Setup

    override func setUpWithError() throws {
        let weatherRepo = MockWeatherService()
        let locationRepo = MockLocationService()
        viewModel = WeatherListViewModel(
            weatherRepository: weatherRepo,
            locationRepository: locationRepo
        )
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.outputs.viewState = { self.viewState.append($0) }
        viewModel.outputs.didTapCell = { self.didTapCell.append($0) }
        viewModel.outputs.cellTypes = { self.cellTypes.append($0) }
        
        viewState.removeAll()
        didTapCell.removeAll()
        cellTypes.removeAll()
    }

    // MARK: - Inputs
    
    func testWeatherListViewModel_viewDidLoad() throws {
        viewModel.inputs.viewDidLoad()
        XCTAssertEqual(.content, viewState.last)
    }
    
    func testWeatherListViewModel_didTapCell() throws {
        viewModel.inputs.didTapCell(with: .currentLocation(weather))
        XCTAssertEqual(true, didTapCell.last)
    }
    
    func testWeatherListViewModel_didTapSearch() throws {
        viewModel.inputs.didTapSearch(for: "cityName")
        XCTAssertEqual(.content, viewState.last)
        XCTAssertEqual(.search, cellTypes.last?[0].section)
    }
}


