//
//  YoutubeEmbed.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/30.
//

import Foundation
import SwiftUI
import WebKit



struct YouTubeView: UIViewRepresentable {
    var viewModel = ViewModel()
    let videoURL: String
    var videoId: String {
        return viewModel.getQueryStringParameter(url: videoURL, param: "v") ?? ""
    }
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}
