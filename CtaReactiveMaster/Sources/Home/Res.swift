//
//  Res.swift
//  CtaReactiveMaster
//
//  Created by 神原良継 on 2020/11/30.
//

import Foundation

struct Res: Codable {
    let status: String!
    let totalRequests: String!
    let articles: [Article]!
}

struct Article: Codable {
    let source: Source!
    let author: String!
    let title: String!
    let description: String!
    let url: String!
    let urlToImage: String!
    let publishedAt: String!
    let content: String!
}

struct Source: Codable {
    let id: String!
    let name: String!
}
