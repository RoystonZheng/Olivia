@Entry
@Component
struct Index {
  @State inputText: string = '';
  @State assistantText: string = '下午好。想吃什么的时候，告诉我就行。';
  @State statusText: string = '安静待命';

  private submitMessage(message?: string): void {
    const content: string = (message ?? this.inputText).trim();
    if (content.length === 0) {
      return;
    }

    this.inputText = '';
    this.statusText = '已收到';

    if (content.includes('吃什么') || content.includes('吃饭')) {
      this.assistantText = '今天想吃哪种口味？可以选清淡、川湘、日料，或者直接告诉我。';
      return;
    }

    if (content.includes('清淡')) {
      this.assistantText = '好，按清淡口味找。下一步我会结合你的位置、预算和距离，给出 3 到 5 家餐厅。';
      return;
    }

    if (content.includes('川湘') || content.includes('辣')) {
      this.assistantText = '好，今天想吃点辣的。下一步我会过滤太远、超预算和已经关门的餐厅。';
      return;
    }

    if (content.includes('日料')) {
      this.assistantText = '好，找日料。等定位与餐厅服务接通后，我会先给你可用候选，再让你继续换预算或换一家。';
      return;
    }

    if (content.includes('打电话')) {
      this.assistantText = '还没有选中餐厅。先选一家，我才能替你拉起商家电话。';
      return;
    }

    this.assistantText = '第一版我会先做好附近餐厅推荐和商家电话。你可以试试说：“中午吃什么。”';
  }

  build() {
    Column() {
      Row() {
        Column({ space: 2 }) {
          Text('Olivia')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor('#17201B')
          Text('你的私人助理')
            .fontSize(14)
            .fontColor('#6D756F')
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Row({ space: 6 }) {
          Circle({ width: 8, height: 8 })
            .fill('#4E8C67')
          Text(this.statusText)
            .fontSize(13)
            .fontColor('#4E6656')
        }
        .padding({ left: 12, right: 12, top: 8, bottom: 8 })
        .backgroundColor('#E8F1EA')
        .borderRadius(18)
      }
      .width('100%')
      .padding({ left: 22, right: 22, top: 22, bottom: 16 })

      Scroll() {
        Column({ space: 18 }) {
          Column({ space: 10 }) {
            Text('现在需要我做什么？')
              .fontSize(16)
              .fontColor('#6D756F')
              .width('100%')

            Text(this.assistantText)
              .fontSize(25)
              .fontWeight(FontWeight.Medium)
              .fontColor('#17201B')
              .lineHeight(36)
              .width('100%')
          }
          .width('100%')
          .padding(22)
          .backgroundColor('#F4F0E7')
          .borderRadius(26)

          Column({ space: 12 }) {
            Text('可以这样开始')
              .fontSize(15)
              .fontWeight(FontWeight.Medium)
              .fontColor('#59615B')
              .width('100%')

            Button('中午吃什么')
              .type(ButtonType.Capsule)
              .width('100%')
              .height(52)
              .fontSize(17)
              .fontColor('#203328')
              .backgroundColor('#E6EFE8')
              .onClick(() => this.submitMessage('中午吃什么'))

            Row({ space: 10 }) {
              Button('清淡')
                .type(ButtonType.Capsule)
                .layoutWeight(1)
                .height(46)
                .fontColor('#455048')
                .backgroundColor('#F0F2F0')
                .onClick(() => this.submitMessage('清淡'))
              Button('川湘')
                .type(ButtonType.Capsule)
                .layoutWeight(1)
                .height(46)
                .fontColor('#455048')
                .backgroundColor('#F0F2F0')
                .onClick(() => this.submitMessage('川湘'))
              Button('日料')
                .type(ButtonType.Capsule)
                .layoutWeight(1)
                .height(46)
                .fontColor('#455048')
                .backgroundColor('#F0F2F0')
                .onClick(() => this.submitMessage('日料'))
            }
            .width('100%')
          }
          .width('100%')

          Row({ space: 10 }) {
            Text('当前为功能骨架')
              .fontSize(13)
              .fontColor('#737A75')
            Blank()
            Text('北京 · 个人测试')
              .fontSize(13)
              .fontColor('#737A75')
          }
          .width('100%')
          .padding({ top: 4, bottom: 8 })
        }
        .width('100%')
        .padding({ left: 22, right: 22 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      Row({ space: 10 }) {
        TextInput({ placeholder: '输入一句话…', text: this.inputText })
          .layoutWeight(1)
          .height(54)
          .fontSize(16)
          .fontColor('#17201B')
          .placeholderColor('#9AA19C')
          .backgroundColor('#F2F3F1')
          .borderRadius(27)
          .padding({ left: 18, right: 18 })
          .onChange((value: string) => {
            this.inputText = value;
          })
          .onSubmit(() => this.submitMessage())

        Button('发送')
          .type(ButtonType.Circle)
          .width(54)
          .height(54)
          .fontSize(15)
          .fontColor('#FFFFFF')
          .backgroundColor('#315B43')
          .onClick(() => this.submitMessage())
      }
      .width('100%')
      .padding({ left: 18, right: 18, top: 12, bottom: 20 })
      .backgroundColor('#FFFFFF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}
