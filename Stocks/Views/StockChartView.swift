//
//  StockChartView.swift
//  Stocks
//
//  Created by Erdicem on 22.05.2022.
//

import Charts
import UIKit

class StockChartView: UIView {

    struct ViewModel {
        let data: [Double]
        let showLegend: Bool
        let showAxis: Bool
    }
    
    private let chartView: LineChartView = {
       let chartView = LineChartView()
        chartView.pinchZoomEnabled = false
        chartView.setScaleEnabled(true)
        chartView.xAxis.enabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.legend.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        return chartView
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(chartView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        chartView.frame = bounds
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    // Reset the chart view
    func reset() {
        chartView.data = nil
    }
    
    func configure (with viewModel: ViewModel) {
        var entries = [ChartDataEntry]()
        
        for (index,value) in viewModel.data.enumerated() {
            entries.append(
                .init(
                    x: Double(index),
                    y: value
                     )
            )
        }
        
        
        let dataSet = LineChartDataSet(entries: entries, label: "Some Label")
        dataSet.fillColor = .systemBlue
        dataSet.drawFilledEnabled = true
        dataSet.drawIconsEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.drawCirclesEnabled = false
        let data = LineChartData(dataSet: dataSet)
        chartView.data = data
    }
}
