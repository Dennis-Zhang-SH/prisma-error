-- CreateTable
CREATE TABLE "AssetLocation" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "location_code" VARCHAR(255) NOT NULL,
    "location_name" VARCHAR(255) NOT NULL,
    "location_description" TEXT NOT NULL,
    "parent_id" INTEGER,

    CONSTRAINT "AssetLocation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AssetLocation_location_code_key" ON "AssetLocation"("location_code");

-- AddForeignKey
ALTER TABLE "AssetLocation" ADD CONSTRAINT "AssetLocation_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "AssetLocation"("id") ON DELETE SET NULL ON UPDATE CASCADE;
