/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.data 1.0

TabbedPane {
    id: tabbedPanel
    showTabsOnActionBar: true
    
    //Tab Blog
    Tab {
        title: "Blog"
        imageSource: "asset:///images/todo.png"
        content: Page {
            content: Label {
                text: "This is my Blog"
            }
        }
    }
    
    //Tab instangram
    Tab {
        title: "Instangram"
        imageSource: "asset:///images/chickened.png"
        content: Page {
            content: ListView {
                id: listView
                dataModel: GroupDataModel {
                    grouping: ItemGrouping.None
                }
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            title: ListItemData["images"]
                        }
                    }
                ]
            }
            attachedObjects: [
                GroupDataModel {
                    id: dataModel
                },
                DataSource {
                    id: dataSource
                    source: "https://api.instagram.com/v1/users/321657074/media/recent/?access_token=321657074.71a398b.fbb9430e14014aa0a8fa05bf05928f58"
                    type: DataSourceType.Json
                    onDataLoaded: {
                        listView.dataModel.clear();
                        listView.dataModel.insertList(data)
                    }
                }
            ]
            onCreationCompleted: {
                dataSource.load();
            }
        }
    }
    
    //Tab something
    Tab {
        title: "something"
        imageSource: "asset:///images/finished.png"
        content: Page {
            content: Label {
                text: "This is my something"
            }
        }
    }
    
    //Tab something
    Tab {
        title: "something"
        imageSource: "asset:///images/ic_share.png"
        content: Page {
            content: Label {
                text: "This is my something"
            }
        }
    }
}
