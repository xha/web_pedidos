<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ItemTipoCaracteristica
 * 
 * @property int $idItem
 * @property int $idTipoCaracteristica
 * @property string $descripcion
 * @property string $longitud
 *
 * @package App\Models
 */
class ItemTipoCaracteristica extends Model
{
	protected $table = 'item_tipo_caracteristica';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'idItem' => 'int',
		'idTipoCaracteristica' => 'int'
	];

	protected $fillable = [
		'descripcion',
		'longitud'
	];
}
