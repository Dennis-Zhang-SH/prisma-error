mod prisma;

#[tokio::main]
async fn main() {
    dotenv::dotenv().unwrap();
    let client = prisma::new_client().await.unwrap();
    println!("begin query");
    let asset = client.asset().create(vec![]).exec().await.unwrap();
    client
        .asset_location()
        .create(
            "str".into(),
            "str".into(),
            "str".into(),
            prisma::asset::id::equals(asset.id),
            vec![prisma::asset_location::parent_id::set(Some(1))],
        )
        .exec()
        .await
        .unwrap();
}
