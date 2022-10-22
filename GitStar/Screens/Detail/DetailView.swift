//
//  DetailView.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetaiViewModel = .init()
    var node: Node
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(spacing: 8) {
                    AvatarImageView(imageURL: node.owner?.avatarUrl ?? "")
                        .frame(width: 80, height: 80)
                    
                    
                    HStack {
                        Text(node.owner?.login ?? "")
                            .font(.title3)
                            .foregroundColor(.primary)
                        
                        Link(destination: URL(string: node.owner?.url ?? "")!) {
                            Image(systemName: "link")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.cardBackgroundColor)
                )
                
                VStack(spacing: 16) {
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(node.name ?? "")
                                .font(.title2)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            HStack {
                                HStack(spacing: 3) {
                                    Image("fork")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                    
                                    Text("\(node.forkCount ?? 0)")
                                        .font(.caption)
                                        .padding(4)
                                }
                                
                                HStack(spacing: 3) {
                                    Image("star")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                    
                                    Text("\(node.stargazerCount ?? 0)")
                                        .font(.caption)
                                        .padding(4)
                                }
                            }
                        }
                        
                        Text(node.descriptionField ?? "")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack(spacing: 8) {
                        Button {
                            viewModel.addOrRemove(node: node)
                        } label: {
                            Label(viewModel.isAdded ? "Remove" : "Save",
                                  systemImage: viewModel.isAdded ? "trash.fill" : "heart")
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                        .background(Color.backgroundColor)
                        .mask(
                            RoundedRectangle(cornerRadius: 9, style: .continuous)
                        )
                        
                        Link(destination: URL(string: node.url ?? "")!) {
                            Label("Go", systemImage: "network")
                                .font(.body)
                                .foregroundColor(.primary)
                                .frame(height: 54)
                                .frame(maxWidth: .infinity)
                                .background(Color.backgroundColor)
                                .mask(
                                    RoundedRectangle(cornerRadius: 9, style: .continuous)
                                )
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.cardBackgroundColor)
                )
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundColor)
        .onAppear {
            viewModel.control(node: node)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(node: createDummyTopic().repositories?.nodes.first ?? Node())
    }
}
